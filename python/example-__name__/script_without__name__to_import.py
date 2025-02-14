print("Hello from the script without __name__")

def main():
    print("main from script_without__name__ will not be run")
if __name__ == '__main__':
    main()