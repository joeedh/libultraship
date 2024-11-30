include("${CMAKE_CURRENT_LIST_DIR}/Default.cmake")

set_config_specific_property("OUTPUT_DIRECTORY" "${CMAKE_SOURCE_DIR}$<$<NOT:$<STREQUAL:${CMAKE_VS_PLATFORM_NAME},Win32>>:/${CMAKE_VS_PLATFORM_NAME}>/${PROPS_CONFIG}")

if(MSVC)
    create_property_reader("DEFAULT_CXX_EXCEPTION_HANDLING")
    create_property_reader("DEFAULT_CXX_DEBUG_INFORMATION_FORMAT")

    set_config_specific_property("DEFAULT_CXX_EXCEPTION_HANDLING" "/EHsc")
    if (CMAKE_C_COMPILER_LAUNCHER STREQUAL "sccache")
        set_config_specific_property("DEFAULT_CXX_DEBUG_INFORMATION_FORMAT" "/Z7")
    else()
        set_config_specific_property("DEFAULT_CXX_DEBUG_INFORMATION_FORMAT" "/Zi")
    endif()
endif()