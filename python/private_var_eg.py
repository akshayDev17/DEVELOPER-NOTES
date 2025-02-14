class Example():
    def __init__(self, private_var_value):
        self.__private_var = private_var_value
    def set_private_var(self, private_var_new_value):
        self.__private_var = private_var_new_value
    def get_private_var(self):
        return self.__private_var

def main():
    eg = Example(45)
    print(dir(eg))
    try:
        print(eg.__private_var)
    except Exception as e:
        print(f"\nWhile printing eg.__private_var, encountered the exception: \n{e}\n")
    print(f"eg.__private_var = {eg.get_private_var()}")
    print("\nChanging the private variable value to 66\n")
    eg.set_private_var(66)
    print(f"eg.__private_var = {eg.get_private_var()}")


if __name__ == '__main__':
    main()