#! /bin/python
import os
import sys
import json

root = "/home/zxy/configfile/"
file = root + ".storage.json"
with open(file, "r") as fp:
    s_j = fp.read()
map = json.loads(s_j)

# print(map)
# print(os.getcwd())
# print(sys.argv)
arg = sys.argv

arg_dic = {}
for i in range(1, len(arg), 2):
    arg_dic[arg[i]] = arg[i + 1]

# print(arg_dic)
if "c" in arg_dic:
    try:
        if os.path.exists(arg_dic["c"]):
            abs_path = os.path.abspath(arg_dic["c"])
            file_name = abs_path.split("/")[-1]
            dot_file = file_name[0] == "."
            if dot_file:
                file_name = file_name[:1]
            if "group" in arg_dic:
                group = arg_dic["group"]
            else:
                group = "None"
            if group not in map:
                map[group] = {}
            if file_name in map[group]:
                print("Error! File already back up!")
            else:
                file_j = map[group][file_name] = {}
                file_j["orgin_path"] = abs_path
                file_j["dot"] = dot_file
                os.system(f"cp -r {abs_path} {root + file_name}")
        else:
            print("No such file or direct")
    except:
        print("Please input file name")

if "m" in arg_dic:
    try:
        if os.path.exists(arg_dic["m"]):
            abs_path = os.path.abspath(arg_dic["m"])
            file_name = abs_path.split("/")[-1]
            dot_file = file_name[0] == "."
            if dot_file:
                file_name = file_name[:1]
            if "group" in arg_dic:
                group = arg_dic["group"]
            else:
                group = "None"
            if group not in map:
                map[group] = {}
            if file_name in map[group]:
                print("Error! File already back up!")
            else:
                file_j = map[group][file_name] = {}
                file_j["orgin_path"] = abs_path
                file_j["dot"] = dot_file
                os.system(f"mv {abs_path} {root + file_name}")
                os.system(f"ln -s {root + file_name} {abs_path}")
        else:
            print("No such file or direct")
    except:
        print("Please input file name")

if "rm" in arg_dic:
    if "group" in arg_dic:
        group = arg_dic["group"]
    else:
        group = "None"
    if arg_dic["rm"] in map[group]:
        map[group].pop(arg_dic["rm"])
        os.system(f"rm -r {root + arg_dic['rm']}")
    else:
        print("File does not exist!")

if "back" in arg_dic:
    if "group" in arg_dic:
        group = arg_dic["group"]
    else:
        group = "None"
    if arg_dic["back"] in map[group]:
        os.system(f"rm {map[group][arg_dic['back']]['orgin_path']}")
        os.system(
            f"cp -r {root + arg_dic['back']} {map[group][arg_dic['back']]['orgin_path']}"
        )
    else:
        print("File does not exist!")


with open(file, "w") as fp:
    fp.write(json.dumps(map))
