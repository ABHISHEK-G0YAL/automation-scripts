import os

def main():
    for filename in os.listdir():
        if filename != 'rename_multiple_files.py':
            new_filename = 
            print(f'{filename} -> {new_filename}')
            # os.rename(filename, new_filename)

if __name__ == '__main__':
    main()