"""
Wrapper around Liquibase
"""
import os

class VsPyLiquibase(object):
    def __init__(self):
        pass

    def _generate_change_log(self,
                             driver:str,
                             url:str,
                             username:str,
                             password:str) -> None:
        """
        Wrapper method around generateChangeLog

        :param driver: Driver name
        :param url: URL of DB connection
        :param username:
        :param password:
        :return:
        """
        cmd = f'liquibase --driver={driver} ' \
            f'--classpath={os.environ["CLASSPATH"]} ' \
            f'--url={url} --changeLogFile=dbchangelog.sql ' \
            f'--username={username} --password={password} ' \
            f'generateChangeLog'
        print(cmd)
        os.system(cmd)

