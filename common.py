import os

def normalize_filename(fn):
    validchars = "-_.() "
    out = ""
    for c in fn:
      if str.isalpha(c) or str.isdigit(c) or (c in validchars):
        out += c
      else:
        out += str(ord(c))
    return out    

def file_remove(fn: str):
  filename = normalize_filename(fn)
  if os.path.exists(filename): os.remove(filename)

