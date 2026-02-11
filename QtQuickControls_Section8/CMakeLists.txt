# Copyright (C) 2026 Qt Group.
# SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

cmake_minimum_required(VERSION 3.16)

project(QtQuickControls_Section8 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appQtQuickControls_Section8
    main.cpp
)

target_include_directories(app${PROJECT_NAME} PRIVATE ColorModel)

qt_add_qml_module(appQtQuickControls_Section8
    URI QtQuickControls_Section8
    VERSION 1.0
    QML_FILES
        Main.qml
        QML/InputControls.qml
        QML/Feedback.qml
        QML/LogosSwipeView.qml
    SOURCES
        ColorModel/colormodel.h
        ColorModel/colormodel.cpp
    RESOURCES
        QtLogos/Qt_20-present.svg
        QtLogos/Qt_16-20.svg
        QtLogos/Qt_14-16.svg
        QtLogos/Qt_28-14.svg
        QtLogos/Qt_20-28.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQtQuickControls_Section8 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQtQuickControls_Section8
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQtQuickControls_Section8
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appQtQuickControls_Section8
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
