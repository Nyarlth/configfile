# configfile

The back configfile save tool!

## Usage

The save fold is named "configfile" locates at the user HOME fold.

### set the config

```bash
back.py config #set the save config at the .backrc at the User HOME fold 
```

### copy file to the save fold

```bash
back.py -c filename@ filename1 filename #only copy the file
```

### move file to the save fold

```bash
back.py -m filename filename1 #mv the file to the fold and create the symble link
```

### remove file 

```bash
back.py -r filename #rm the file at the fold 
```

### back the file

```bash
back.py -b filename #return the file to their origin path
```

## config

the configfile save the save fold path and the preref env path.
