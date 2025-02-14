import script_with__name__to_import, script_without__name__to_import
print(f"hello from the main script, that has __name__ = {__name__}")

print(f"`script_with__name__to_import.__name__` = {script_with__name__to_import.__name__}")
print(f"`script_without__name__to_import.__name__` = {script_without__name__to_import.__name__}")

"""
1. on running this script , only the two print statements, this and the one from `script_without__name__to_import.py`'s get triggered, 
with the ones from the latter being triggered earlier because it was imported and then this script's print 
function was written.
2. only when you run the script_with__name_to_import.py will you see its print statement.
    1. this is because during that, the __name__ attribute for that script is set to "__main__"
    2. otherwise, when a script is imported, its __name__ attribute is set to its own name.
"""