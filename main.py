"""
   Start of duplicate project of AdrarOs With Python Programing Language
"""
import sys

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtCore import QUrl
from PyQt5.QtQml import QQmlApplicationEngine

if __name__ == '__main__':
    MYAPP = QGuiApplication(sys.argv)
    APPROOT = QQmlApplicationEngine()
    APPROOT.load(QUrl("DialogC.qml"))
    WIN = APPROOT.rootObjects()[0]
    WIN.show()
    sys.exit(MYAPP.exec_())
