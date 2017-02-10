"""
   Start of duplicate project of AdrarOs With Python Programing Language
"""
import sys
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQuick import QQuickView
from PyQt5.QtCore import QUrl

if __name__ == '__main__' :
    myApp = QApplication(sys.argv)
    appQml = QQuickView()
    appQml.setSource(QUrl("main.qml"))
    appQml.show()
    myApp.exec_()
    sys.exit 


