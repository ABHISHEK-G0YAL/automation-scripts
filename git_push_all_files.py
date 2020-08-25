import os

def main():
    for filename in os.listdir():
        command = f'git add {filename}'
        print(command)
        os.system(command)
        commit_msg = f'Added {filename}'
        command = f'git commit -m "{commit_msg}"'
        print(command)
        os.system(command)
        print('git push')
        os.system('git push')

if __name__ == '__main__':
    main() 