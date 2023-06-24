from get_checkstyle_group import get_checkstyle_group


def main():
    group = get_checkstyle_group()
    print(group.version)


if __name__ == "__main__":
    main()
