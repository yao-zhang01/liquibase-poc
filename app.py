import os
from modules import VsPyLiquibase

def main():
    # Generating change log for the very first time
    liquibase_wrapper = VsPyLiquibase()
    liquibase_wrapper._generate_change_log(
        driver=os.environ["MYSQL_DRIVER"],
        url=os.environ["DB_URL"],
        username=os.environ["DB_USERNAME"],
        password=os.environ["DB_PASSWORD"]
    )

    print('Hello liquibase app running')
if __name__ == '__main__':
    main()
