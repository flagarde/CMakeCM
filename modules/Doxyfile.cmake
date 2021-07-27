include_guard(GLOBAL)

file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/Doxyfile.in"
"# Doxyfile 1.9.1

if(POLICY CMP0053)
  cmake_policy(SET CMP0053 NEW)
endif()

#---------------------------------------------------------------------------
# Project related configuration options
#---------------------------------------------------------------------------
DOXYFILE_ENCODING      = UTF-8
PROJECT_NAME           = @DOXYGEN_PROJECT_NAME@
PROJECT_NUMBER         = @DOXYGEN_PROJECT_NUMBER@
PROJECT_BRIEF          = @DOXYGEN_PROJECT_BRIEF@
PROJECT_LOGO           = @DOXYGEN_PROJECT_LOGO@
OUTPUT_DIRECTORY       = @DOXYGEN_OUTPUT_DIRECTORY@
CREATE_SUBDIRS         = @DOXYGEN_CREATE_SUBDIRS@
ALLOW_UNICODE_NAMES    = @DOXYGEN_ALLOW_UNICODE_NAMES@
OUTPUT_LANGUAGE        = @DOXYGEN_OUTPUT_LANGUAGE@
OUTPUT_TEXT_DIRECTION  = @DOXYGEN_OUTPUT_TEXT_DIRECTION@
BRIEF_MEMBER_DESC      = @DOXYGEN_BRIEF_MEMBER_DESC@
REPEAT_BRIEF           = @DOXYGEN_REPEAT_BRIEF@
ABBREVIATE_BRIEF       = @DOXYGEN_ABBREVIATE_BRIEF@
ALWAYS_DETAILED_SEC    = @DOXYGEN_ALWAYS_DETAILED_SEC@
INLINE_INHERITED_MEMB  = @DOXYGEN_INLINE_INHERITED_MEMB@
FULL_PATH_NAMES        = @DOXYGEN_FULL_PATH_NAMES@
STRIP_FROM_PATH        = @DOXYGEN_STRIP_FROM_PATH@
STRIP_FROM_INC_PATH    = @DOXYGEN_STRIP_FROM_INC_PATH@
SHORT_NAMES            = @DOXYGEN_SHORT_NAMES@
JAVADOC_AUTOBRIEF      = @DOXYGEN_JAVADOC_AUTOBRIEF@
JAVADOC_BANNER         = @DOXYGEN_JAVADOC_BANNER@
QT_AUTOBRIEF           = @DOXYGEN_QT_AUTOBRIEF@
MULTILINE_CPP_IS_BRIEF = @DOXYGEN_MULTILINE_CPP_IS_BRIEF@
PYTHON_DOCSTRING       = @DOXYGEN_PYTHON_DOCSTRING@
INHERIT_DOCS           = @DOXYGEN_INHERIT_DOCS@
SEPARATE_MEMBER_PAGES  = @DOXYGEN_SEPARATE_MEMBER_PAGES@
TAB_SIZE               = @DOXYGEN_TAB_SIZE@
ALIASES                = @DOXYGEN_ALIASES@
OPTIMIZE_OUTPUT_FOR_C  = @DOXYGEN_OPTIMIZE_OUTPUT_FOR_C@
OPTIMIZE_OUTPUT_JAVA   = @DOXYGEN_OPTIMIZE_OUTPUT_JAVA@
OPTIMIZE_FOR_FORTRAN   = @DOXYGEN_OPTIMIZE_FOR_FORTRAN@
OPTIMIZE_OUTPUT_VHDL   = @DOXYGEN_OPTIMIZE_OUTPUT_VHDL@
OPTIMIZE_OUTPUT_SLICE  = @DOXYGEN_OPTIMIZE_OUTPUT_SLICE@
EXTENSION_MAPPING      = @DOXYGEN_EXTENSION_MAPPING@
MARKDOWN_SUPPORT       = @DOXYGEN_MARKDOWN_SUPPORT@
TOC_INCLUDE_HEADINGS   = @DOXYGEN_TOC_INCLUDE_HEADINGS@
AUTOLINK_SUPPORT       = @DOXYGEN_AUTOLINK_SUPPORT@
BUILTIN_STL_SUPPORT    = @DOXYGEN_BUILTIN_STL_SUPPORT@
CPP_CLI_SUPPORT        = @DOXYGEN_CPP_CLI_SUPPORT@
SIP_SUPPORT            = @DOXYGEN_SIP_SUPPORT@
IDL_PROPERTY_SUPPORT   = @DOXYGEN_IDL_PROPERTY_SUPPORT@
DISTRIBUTE_GROUP_DOC   = @DOXYGEN_DISTRIBUTE_GROUP_DOC@
GROUP_NESTED_COMPOUNDS = @DOXYGEN_GROUP_NESTED_COMPOUNDS@
SUBGROUPING            = @DOXYGEN_SUBGROUPING@
INLINE_GROUPED_CLASSES = @DOXYGEN_INLINE_GROUPED_CLASSES@
INLINE_SIMPLE_STRUCTS  = @DOXYGEN_INLINE_SIMPLE_STRUCTS@
TYPEDEF_HIDES_STRUCT   = @DOXYGEN_TYPEDEF_HIDES_STRUCT@
LOOKUP_CACHE_SIZE      = @DOXYGEN_LOOKUP_CACHE_SIZE@
NUM_PROC_THREADS       = @DOXYGEN_NUM_PROC_THREADS@
#---------------------------------------------------------------------------
# Build related configuration options
#---------------------------------------------------------------------------
EXTRACT_ALL            = @DOXYGEN_EXTRACT_ALL@
EXTRACT_PRIVATE        = @DOXYGEN_EXTRACT_PRIVATE@
EXTRACT_PRIV_VIRTUAL   = @DOXYGEN_EXTRACT_PRIV_VIRTUAL@
EXTRACT_PACKAGE        = @DOXYGEN_EXTRACT_PACKAGE@
EXTRACT_STATIC         = @DOXYGEN_EXTRACT_STATIC@
EXTRACT_LOCAL_CLASSES  = @DOXYGEN_EXTRACT_LOCAL_CLASSES@
EXTRACT_LOCAL_METHODS  = @DOXYGEN_EXTRACT_LOCAL_METHODS@
EXTRACT_ANON_NSPACES   = @DOXYGEN_EXTRACT_ANON_NSPACES@
RESOLVE_UNNAMED_PARAMS = @DOXYGEN_RESOLVE_UNNAMED_PARAMS@
HIDE_UNDOC_MEMBERS     = @DOXYGEN_HIDE_UNDOC_MEMBERS@
HIDE_UNDOC_CLASSES     = @DOXYGEN_HIDE_UNDOC_CLASSES@
HIDE_FRIEND_COMPOUNDS  = @DOXYGEN_HIDE_FRIEND_COMPOUNDS@
HIDE_IN_BODY_DOCS      = @DOXYGEN_HIDE_IN_BODY_DOCS@
INTERNAL_DOCS          = @DOXYGEN_INTERNAL_DOCS@
CASE_SENSE_NAMES       = @DOXYGEN_CASE_SENSE_NAMES@
HIDE_SCOPE_NAMES       = @DOXYGEN_HIDE_SCOPE_NAMES@
HIDE_COMPOUND_REFERENCE= @DOXYGEN_HIDE_COMPOUND_REFERENCE@
SHOW_INCLUDE_FILES     = @DOXYGEN_SHOW_INCLUDE_FILES@
SHOW_GROUPED_MEMB_INC  = @DOXYGEN_SHOW_GROUPED_MEMB_INC@
FORCE_LOCAL_INCLUDES   = @DOXYGEN_FORCE_LOCAL_INCLUDES@
INLINE_INFO            = @DOXYGEN_INLINE_INFO@
SORT_MEMBER_DOCS       = @DOXYGEN_SORT_MEMBER_DOCS@
SORT_BRIEF_DOCS        = @DOXYGEN_SORT_BRIEF_DOCS@
SORT_MEMBERS_CTORS_1ST = @DOXYGEN_SORT_MEMBERS_CTORS_1ST@
SORT_GROUP_NAMES       = @DOXYGEN_SORT_GROUP_NAMES@
SORT_BY_SCOPE_NAME     = @DOXYGEN_SORT_BY_SCOPE_NAME@
STRICT_PROTO_MATCHING  = @DOXYGEN_STRICT_PROTO_MATCHING@
GENERATE_TODOLIST      = @DOXYGEN_GENERATE_TODOLIST@
GENERATE_TESTLIST      = @DOXYGEN_GENERATE_TESTLIST@
GENERATE_BUGLIST       = @DOXYGEN_GENERATE_BUGLIST@
GENERATE_DEPRECATEDLIST= @DOXYGEN_GENERATE_DEPRECATEDLIST@
ENABLED_SECTIONS       = @DOXYGEN_ENABLED_SECTIONS@
MAX_INITIALIZER_LINES  = @DOXYGEN_MAX_INITIALIZER_LINES@
SHOW_USED_FILES        = @DOXYGEN_SHOW_USED_FILES@
SHOW_FILES             = @DOXYGEN_SHOW_FILES@
SHOW_NAMESPACES        = @DOXYGEN_SHOW_NAMESPACES@
FILE_VERSION_FILTER    = @DOXYGEN_FILE_VERSION_FILTER@
LAYOUT_FILE            = @DOXYGEN_LAYOUT_FILE@
CITE_BIB_FILES         = @DOXYGEN_CITE_BIB_FILES@
#---------------------------------------------------------------------------
# Configuration options related to warning and progress messages
#---------------------------------------------------------------------------
QUIET                  = @DOXYGEN_QUIET@
WARNINGS               = @DOXYGEN_WARNINGS@
WARN_IF_UNDOCUMENTED   = @DOXYGEN_WARN_IF_UNDOCUMENTED@
WARN_IF_DOC_ERROR      = @DOXYGEN_WARN_IF_DOC_ERROR@
WARN_NO_PARAMDOC       = @DOXYGEN_WARN_NO_PARAMDOC@
WARN_AS_ERROR          = @DOXYGEN_WARN_AS_ERROR@
WARN_FORMAT            = @DOXYGEN_WARN_FORMAT@
WARN_LOGFILE           = @DOXYGEN_WARN_LOGFILE@
#---------------------------------------------------------------------------
# Configuration options related to the input files
#---------------------------------------------------------------------------
INPUT                  = @DOXYGEN_INPUT@
INPUT_ENCODING         = @DOXYGEN_UTF-8@
FILE_PATTERNS          = @DOXYGEN_FILE_PATTERNS@
RECURSIVE              = @DOXYGEN_RECURSIVE@
EXCLUDE                = @DOXYGEN_EXCLUDE@
EXCLUDE_SYMLINKS       = @DOXYGEN_EXCLUDE_SYMLINKS@
EXCLUDE_PATTERNS       = @DOXYGEN_EXCLUDE_PATTERNS@
EXCLUDE_SYMBOLS        = @DOXYGEN_EXCLUDE_SYMBOLS@
EXAMPLE_PATH           = @DOXYGEN_EXAMPLE_PATH@
EXAMPLE_PATTERNS       = @DOXYGEN_EXAMPLE_PATTERNS@
EXAMPLE_RECURSIVE      = @DOXYGEN_EXAMPLE_RECURSIVE@
IMAGE_PATH             = @DOXYGEN_IMAGE_PATH@
INPUT_FILTER           = @DOXYGEN_INPUT_FILTER@
FILTER_PATTERNS        = @DOXYGEN_FILTER_PATTERNS@
FILTER_SOURCE_FILES    = @DOXYGEN_FILTER_SOURCE_FILES@
FILTER_SOURCE_PATTERNS = @DOXYGEN_FILTER_SOURCE_PATTERNS@
USE_MDFILE_AS_MAINPAGE = @DOXYGEN_USE_MDFILE_AS_MAINPAGE@
#---------------------------------------------------------------------------
# Configuration options related to source browsing
#---------------------------------------------------------------------------
SOURCE_BROWSER         = @DOXYGEN_SOURCE_BROWSER@
INLINE_SOURCES         = @DOXYGEN_INLINE_SOURCES@
STRIP_CODE_COMMENTS    = @DOXYGEN_STRIP_CODE_COMMENTS@
REFERENCED_BY_RELATION = @DOXYGEN_REFERENCED_BY_RELATION@
REFERENCES_RELATION    = @DOXYGEN_REFERENCES_RELATION@
REFERENCES_LINK_SOURCE = @DOXYGEN_REFERENCES_LINK_SOURCE@
SOURCE_TOOLTIPS        = @DOXYGEN_SOURCE_TOOLTIPS@
USE_HTAGS              = @DOXYGEN_USE_HTAGS@
VERBATIM_HEADERS       = @DOXYGEN_VERBATIM_HEADERS@
#---------------------------------------------------------------------------
# Configuration options related to the alphabetical class index
#---------------------------------------------------------------------------
ALPHABETICAL_INDEX     = @DOXYGEN_ALPHABETICAL_INDEX@
IGNORE_PREFIX          = @DOXYGEN_IGNORE_PREFIX@
#---------------------------------------------------------------------------
# Configuration options related to the HTML output
#---------------------------------------------------------------------------
GENERATE_HTML          = @DOXYGEN_GENERATE_HTML@
HTML_OUTPUT            = @DOXYGEN_HTML_OUTPUT@
HTML_FILE_EXTENSION    = @DOXYGEN_HTML_FILE_EXTENSION@
HTML_HEADER            = @DOXYGEN_HTML_HEADER@
HTML_FOOTER            = @DOXYGEN_HTML_FOOTER@
HTML_STYLESHEET        = @DOXYGEN_HTML_STYLESHEET@
HTML_EXTRA_STYLESHEET  = @DOXYGEN_HTML_EXTRA_STYLESHEET@
HTML_EXTRA_FILES       = @DOXYGEN_HTML_EXTRA_FILES@
HTML_COLORSTYLE_HUE    = @DOXYGEN_HTML_COLORSTYLE_HUE@
HTML_COLORSTYLE_SAT    = @DOXYGEN_HTML_COLORSTYLE_SAT@
HTML_COLORSTYLE_GAMMA  = @DOXYGEN_HTML_COLORSTYLE_GAMMA@
HTML_TIMESTAMP         = @DOXYGEN_HTML_TIMESTAMP@
HTML_DYNAMIC_MENUS     = @DOXYGEN_HTML_DYNAMIC_MENUS@
HTML_DYNAMIC_SECTIONS  = @DOXYGEN_HTML_DYNAMIC_SECTIONS@
HTML_INDEX_NUM_ENTRIES = @DOXYGEN_HTML_INDEX_NUM_ENTRIES@
GENERATE_DOCSET        = @DOXYGEN_GENERATE_DOCSET@
DOCSET_FEEDNAME        = @DOXYGEN_DOCSET_FEEDNAME@
DOCSET_BUNDLE_ID       = @DOXYGEN_DOCSET_BUNDLE_ID@
DOCSET_PUBLISHER_ID    = @DOXYGEN_DOCSET_PUBLISHER_ID@
DOCSET_PUBLISHER_NAME  = @DOXYGEN_DOCSET_PUBLISHER_NAME@
GENERATE_HTMLHELP      = @DOXYGEN_GENERATE_HTMLHELP@
CHM_FILE               = @DOXYGEN_CHM_FILE@
HHC_LOCATION           = @DOXYGEN_HHC_LOCATION@
GENERATE_CHI           = @DOXYGEN_GENERATE_CHI@
CHM_INDEX_ENCODING     = @DOXYGEN_CHM_INDEX_ENCODING@
BINARY_TOC             = @DOXYGEN_BINARY_TOC@
TOC_EXPAND             = @DOXYGEN_TOC_EXPAND@
GENERATE_QHP           = @DOXYGEN_GENERATE_QHP@
QCH_FILE               = @DOXYGEN_QCH_FILE@
QHP_NAMESPACE          = @DOXYGEN_QHP_NAMESPACE@
QHP_VIRTUAL_FOLDER     = @DOXYGEN_QHP_VIRTUAL_FOLDER@
QHP_CUST_FILTER_NAME   = @DOXYGEN_QHP_CUST_FILTER_NAME@
QHP_CUST_FILTER_ATTRS  = @DOXYGEN_QHP_CUST_FILTER_ATTRS@
QHP_SECT_FILTER_ATTRS  = @DOXYGEN_QHP_SECT_FILTER_ATTRS@
QHG_LOCATION           = @DOXYGEN_QHG_LOCATION@
GENERATE_ECLIPSEHELP   = @DOXYGEN_GENERATE_ECLIPSEHELP@
ECLIPSE_DOC_ID         = @DOXYGEN_ECLIPSE_DOC_ID@
DISABLE_INDEX          = @DOXYGEN_DISABLE_INDEX@
GENERATE_TREEVIEW      = @DOXYGEN_GENERATE_TREEVIEW@
ENUM_VALUES_PER_LINE   = @DOXYGEN_ENUM_VALUES_PER_LINE@
TREEVIEW_WIDTH         = @DOXYGEN_TREEVIEW_WIDTH@
EXT_LINKS_IN_WINDOW    = @DOXYGEN_EXT_LINKS_IN_WINDOW@
HTML_FORMULA_FORMAT    = @DOXYGEN_HTML_FORMULA_FORMAT@
FORMULA_FONTSIZE       = @DOXYGEN_FORMULA_FONTSIZE@
FORMULA_TRANSPARENT    = @DOXYGEN_FORMULA_TRANSPARENT@
FORMULA_MACROFILE      = @DOXYGEN_FORMULA_MACROFILE@
USE_MATHJAX            = @DOXYGEN_USE_MATHJAX@
MATHJAX_FORMAT         = @DOXYGEN_MATHJAX_FORMAT@
MATHJAX_RELPATH        = @DOXYGEN_MATHJAX_RELPATH@
MATHJAX_EXTENSIONS     = @DOXYGEN_MATHJAX_EXTENSIONS@
MATHJAX_CODEFILE       = @DOXYGEN_MATHJAX_CODEFILE@
SEARCHENGINE           = @DOXYGEN_SEARCHENGINE@
SERVER_BASED_SEARCH    = @DOXYGEN_SERVER_BASED_SEARCH@
EXTERNAL_SEARCH        = @DOXYGEN_EXTERNAL_SEARCH@
SEARCHENGINE_URL       = @DOXYGEN_SEARCHENGINE_URL@
SEARCHDATA_FILE        = @DOXYGEN_SEARCHDATA_FILE@
EXTERNAL_SEARCH_ID     = @DOXYGEN_EXTERNAL_SEARCH_ID@
EXTRA_SEARCH_MAPPINGS  = @DOXYGEN_EXTRA_SEARCH_MAPPINGS@
#---------------------------------------------------------------------------
# Configuration options related to the LaTeX output
#---------------------------------------------------------------------------
GENERATE_LATEX         = @DOXYGEN_GENERATE_LATEX@
LATEX_OUTPUT           = @DOXYGEN_LATEX_OUTPUT@
LATEX_CMD_NAME         = @DOXYGEN_LATEX_CMD_NAME@
MAKEINDEX_CMD_NAME     = @DOXYGEN_MAKEINDEX_CMD_NAME@
LATEX_MAKEINDEX_CMD    = @DOXYGEN_LATEX_MAKEINDEX_CMD@
COMPACT_LATEX          = @DOXYGEN_COMPACT_LATEX@
PAPER_TYPE             = @DOXYGEN_PAPER_TYPE@
EXTRA_PACKAGES         = @DOXYGEN_EXTRA_PACKAGES@
LATEX_HEADER           = @DOXYGEN_LATEX_HEADER@
LATEX_FOOTER           = @DOXYGEN_LATEX_FOOTER@
LATEX_EXTRA_STYLESHEET = @DOXYGEN_LATEX_EXTRA_STYLESHEET@
LATEX_EXTRA_FILES      = @DOXYGEN_LATEX_EXTRA_FILES@
PDF_HYPERLINKS         = @DOXYGEN_PDF_HYPERLINKS@
USE_PDFLATEX           = @DOXYGEN_USE_PDFLATEX@
LATEX_BATCHMODE        = @DOXYGEN_LATEX_BATCHMODE@
LATEX_HIDE_INDICES     = @DOXYGEN_LATEX_HIDE_INDICES@
LATEX_SOURCE_CODE      = @DOXYGEN_LATEX_SOURCE_CODE@
LATEX_BIB_STYLE        = @DOXYGEN_LATEX_BIB_STYLE@
LATEX_TIMESTAMP        = @DOXYGEN_LATEX_TIMESTAMP@
LATEX_EMOJI_DIRECTORY  = @DOXYGEN_LATEX_EMOJI_DIRECTORY@
#---------------------------------------------------------------------------
# Configuration options related to the RTF output
#---------------------------------------------------------------------------
GENERATE_RTF           = @DOXYGEN_GENERATE_RTF@
RTF_OUTPUT             = @DOXYGEN_RTF_OUTPUT@
COMPACT_RTF            = @DOXYGEN_COMPACT_RTF@
RTF_HYPERLINKS         = @DOXYGEN_RTF_HYPERLINKS@
RTF_STYLESHEET_FILE    = @DOXYGEN_RTF_STYLESHEET_FILE@
RTF_EXTENSIONS_FILE    = @DOXYGEN_RTF_EXTENSIONS_FILE@
RTF_SOURCE_CODE        = @DOXYGEN_RTF_SOURCE_CODE@
#---------------------------------------------------------------------------
# Configuration options related to the man page output
#---------------------------------------------------------------------------
GENERATE_MAN           = @DOXYGEN_GENERATE_MAN@
MAN_OUTPUT             = @DOXYGEN_MAN_OUTPUT@
MAN_EXTENSION          = @DOXYGEN_MAN_EXTENSION@
MAN_SUBDIR             = @DOXYGEN_MAN_SUBDIR@
MAN_LINKS              = @DOXYGEN_MAN_LINKS@
#---------------------------------------------------------------------------
# Configuration options related to the XML output
#---------------------------------------------------------------------------
GENERATE_XML           = @DOXYGEN_GENERATE_XML@
XML_OUTPUT             = @DOXYGEN_XML_OUTPUT@
XML_PROGRAMLISTING     = @DOXYGEN_XML_PROGRAMLISTING@
XML_NS_MEMB_FILE_SCOPE = @DOXYGEN_XML_NS_MEMB_FILE_SCOPE@
#---------------------------------------------------------------------------
# Configuration options related to the DOCBOOK output
#---------------------------------------------------------------------------
GENERATE_DOCBOOK       = @DOXYGEN_GENERATE_DOCBOOK@
DOCBOOK_OUTPUT         = @DOXYGEN_DOCBOOK_OUTPUT@
DOCBOOK_PROGRAMLISTING = @DOXYGEN_DOCBOOK_PROGRAMLISTING@
#---------------------------------------------------------------------------
# Configuration options for the AutoGen Definitions output
#---------------------------------------------------------------------------
GENERATE_AUTOGEN_DEF   = @DOXYGEN_GENERATE_AUTOGEN_DEF@
#---------------------------------------------------------------------------
# Configuration options related to the Perl module output
#---------------------------------------------------------------------------
GENERATE_PERLMOD       = @DOXYGEN_GENERATE_PERLMOD@
PERLMOD_LATEX          = @DOXYGEN_PERLMOD_LATEX@
PERLMOD_PRETTY         = @DOXYGEN_PERLMOD_PRETTY@
PERLMOD_MAKEVAR_PREFIX = @DOXYGEN_PERLMOD_MAKEVAR_PREFIX@
#---------------------------------------------------------------------------
# Configuration options related to the preprocessor
#---------------------------------------------------------------------------
ENABLE_PREPROCESSING   = @DOXYGEN_ENABLE_PREPROCESSING@
MACRO_EXPANSION        = @DOXYGEN_MACRO_EXPANSION@
EXPAND_ONLY_PREDEF     = @DOXYGEN_EXPAND_ONLY_PREDEF@
SEARCH_INCLUDES        = @DOXYGEN_SEARCH_INCLUDES@
INCLUDE_PATH           = @DOXYGEN_INCLUDE_PATH@
INCLUDE_FILE_PATTERNS  = @DOXYGEN_INCLUDE_FILE_PATTERNS@
PREDEFINED             = @DOXYGEN_PREDEFINED@
EXPAND_AS_DEFINED      = @DOXYGEN_EXPAND_AS_DEFINED@
SKIP_FUNCTION_MACROS   = @DOXYGEN_SKIP_FUNCTION_MACROS@
#---------------------------------------------------------------------------
# Configuration options related to external references
#---------------------------------------------------------------------------
TAGFILES               = @DOXYGEN_TAGFILES@
GENERATE_TAGFILE       = @DOXYGEN_GENERATE_TAGFILE@
ALLEXTERNALS           = @DOXYGEN_ALLEXTERNALS@
EXTERNAL_GROUPS        = @DOXYGEN_EXTERNAL_GROUPS@
EXTERNAL_PAGES         = @DOXYGEN_EXTERNAL_PAGES@
#---------------------------------------------------------------------------
# Configuration options related to the dot tool
#---------------------------------------------------------------------------
CLASS_DIAGRAMS         = @DOXYGEN_CLASS_DIAGRAMS@
DIA_PATH               = @DOXYGEN_DIA_PATH@
HIDE_UNDOC_RELATIONS   = @DOXYGEN_HIDE_UNDOC_RELATIONS@
HAVE_DOT               = @DOXYGEN_HAVE_DOT@
DOT_NUM_THREADS        = @DOXYGEN_DOT_NUM_THREADS@
DOT_FONTNAME           = @DOXYGEN_DOT_FONTNAME@
DOT_FONTSIZE           = @DOXYGEN_DOT_FONTSIZE@
DOT_FONTPATH           = @DOXYGEN_DOT_FONTPATH@
CLASS_GRAPH            = @DOXYGEN_CLASS_GRAPH@
COLLABORATION_GRAPH    = @DOXYGEN_COLLABORATION_GRAPH@
GROUP_GRAPHS           = @DOXYGEN_GROUP_GRAPHS@
UML_LOOK               = @DOXYGEN_UML_LOOK@
UML_LIMIT_NUM_FIELDS   = @DOXYGEN_UML_LIMIT_NUM_FIELDS@
DOT_UML_DETAILS        = @DOXYGEN_DOT_UML_DETAILS@
DOT_WRAP_THRESHOLD     = @DOXYGEN_DOT_WRAP_THRESHOLD@
TEMPLATE_RELATIONS     = @DOXYGEN_TEMPLATE_RELATIONS@
INCLUDE_GRAPH          = @DOXYGEN_INCLUDE_GRAPH@
INCLUDED_BY_GRAPH      = @DOXYGEN_INCLUDED_BY_GRAPH@
CALL_GRAPH             = @DOXYGEN_CALL_GRAPH@
CALLER_GRAPH           = @DOXYGEN_CALLER_GRAPH@
GRAPHICAL_HIERARCHY    = @DOXYGEN_GRAPHICAL_HIERARCHY@
DIRECTORY_GRAPH        = @DOXYGEN_DIRECTORY_GRAPH@
DOT_IMAGE_FORMAT       = @DOXYGEN_DOT_IMAGE_FORMAT@
INTERACTIVE_SVG        = @DOXYGEN_INTERACTIVE_SVG@
DOT_PATH               = @DOXYGEN_DOT_PATH@
DOTFILE_DIRS           = @DOXYGEN_DOTFILE_DIRS@
MSCFILE_DIRS           = @DOXYGEN_MSCFILE_DIRS@
DIAFILE_DIRS           = @DOXYGEN_DIAFILE_DIRS@
PLANTUML_JAR_PATH      = @DOXYGEN_PLANTUML_JAR_PATH@
PLANTUML_CFG_FILE      = @DOXYGEN_PLANTUML_CFG_FILE@
PLANTUML_INCLUDE_PATH  = @DOXYGEN_PLANTUML_INCLUDE_PATH@
DOT_GRAPH_MAX_NODES    = @DOXYGEN_DOT_GRAPH_MAX_NODES@
MAX_DOT_GRAPH_DEPTH    = @DOXYGEN_MAX_DOT_GRAPH_DEPTH@
DOT_TRANSPARENT        = @DOXYGEN_DOT_TRANSPARENT@
DOT_MULTI_TARGETS      = @DOXYGEN_DOT_MULTI_TARGETS@
GENERATE_LEGEND        = @DOXYGEN_GENERATE_LEGEND@
DOT_CLEANUP            = @DOXYGEN_DOT_CLEANUP@")
