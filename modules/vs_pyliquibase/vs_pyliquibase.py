"""
Wrapper around Liquibase

TODO: Complete class methods for running liquibase migration
Reference: https://www.liquibase.org/get_started/quickstart_lb.html
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
        :return: None
        """
        cmd = f'liquibase --driver={driver} ' \
            f'--classpath=../../../{os.environ["CLASSPATH"]} ' \
            f'--url={url} --changeLogFile=dbchangelog.sql ' \
            f'--username={username} --password={password} ' \
            f'--logLevel=debug ' \
            f'generateChangeLog'
        print(f'Running generateChangeLog command: {cmd}')
        os.system(cmd)

    def _add_change_set(self):
        pass

    def _run_change_set(self):
        pass

    def _get_db_status(self):
        pass
