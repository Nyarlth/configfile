#! /bin/python
import os
import sys
import json

def change(old:str, keys:dict) -> str:
    new = old
    for key, path in keys.items():
        new = new.replace("{%s}"%key, path)
    return new
def _change(old:str, keys:dict) -> str:
    new = old
    for key, path in keys.items():
        new = new.replace(path ,"{%s}"%key)
    return new

def args_solve():
    dic = {}
    _ = []
    arg_list = []
    for i in sys.argv[1:]:
        if i[0]=="-":
            arg_list.append(i)
            _ = []
            dic[i] = _
        else:
            _.append(i.split("@"))
    return dic, arg_list

def solve(key,file):
    if   key == "-c":
        _c(*file)
    elif key == "-m":
        _m(*file)
    elif key == "-r":
        _r(*file)
    elif key == "-b":
        _b(*file)
    elif key == "-s":
        _s(*file)

def _c(file,group = "None"):
    if os.path.exists(file):
        abs_path = os.path.abspath(file)
        file_name = abs_path.split("/")[-1]
        dot_file = file_name[0] == "."
        if dot_file:
            file_name = file_name[1:]
        
        if group not in map:
            map[group] = {}
        if file_name in map[group]:
            print("Error! File already back up!")
        else:
            os.system(f"cp -r {abs_path} {root + file_name}")
            file_j = map[group][file_name] = {}
            file_j["orgin_path"] = _change(abs_path,path_ref)
            file_j["dot"] = dot_file
    else:
        print("No such file named %s"%file)

def _m(file,group = "None"):
    if os.path.exists(file):
        abs_path = os.path.abspath(file)
        file_name = abs_path.split("/")[-1]
        dot_file = file_name[0] == "."
        if dot_file:
            file_name = file_name[1:]
        
        if group not in map:
            map[group] = {}
        if file_name in map[group]:
            print("Error! File already back up!")
        else:
            os.system(f"mv {abs_path} {root + file_name}")
            os.system(f"ln -s {root + file_name} {abs_path}")
            file_j = map[group][file_name] = {}
            file_j["orgin_path"] = _change(abs_path,path_ref)
            file_j["dot"] = dot_file
    else:
        print("No such file named %s"%file)

def _r(file, group="None"):
    if file in map[group]:
        map[group].pop(file)
        os.system(f"rm -r {root + file}")
    else:
        print("%s does not exist!"%file)

def _s(file, group="None"):
    if  file in map[group]:
        os.system(f"rm -r {change(map[group][file]['orgin_path'],path_ref)}")
        os.system(
            f"ln -s {root + file} {change(map[group][file]['orgin_path'],path_ref)}"
        )
    else:
        print("%s does not exist!"%file)
    
def _b(file, group="None"):
    if  file in map[group]:
        os.system(f"rm -r {change(map[group][file]['orgin_path'],path_ref)}")
        os.system(
            f"cp -r {root + file} {change(map[group][file]['orgin_path'],path_ref)}"
        )
    else:
        print("%s does not exist!"%file)

def set_config():
    path = os.getcwd() + "/"
    path_ = input(f"Input the correct path, default is <{path}> :")
    if path_ and os.path.exists(path_):
        path = path_
    
    backrc = {"path":path}
    backrc["Env"] = ["HOME"]
    backrc["ref"] = {}
    with open(f"{os.getenv('HOME') + '/.backrc'}", "w") as fp:
        fp.write(json.dumps(backrc))


arg = sys.argv

try:
    if arg[1] == "config":
        set_config()
except:
    pass

if os.path.exists(os.getenv("HOME") + "/.backrc"):
    with open(os.getenv("HOME") + "/.backrc", "r") as fp:
        backrc = json.loads(fp.read())
    root = backrc["path"] 
else:
    root = "{HOME}" + "/configfile/"
path_ref = backrc["ref"]
for i in backrc["Env"]:
    if i not in path_ref:
        path_ref[i] = os.getenv("HOME")

file = change(root, path_ref) + ".storage.json"
with open(file, "r") as fp :
    s_j = fp.read()
map = json.loads(s_j)
arg_dic, arg_list = args_solve()

for key in arg_list:
    for i in arg_dic[key]:
        solve(key,i)

with open(file, "w") as fp:
    fp.write(json.dumps(map))
