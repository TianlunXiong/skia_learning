#include "em_macro.hpp"

EM_PORT_API(const char*) get_str() {
  static const char str[] = "Hello, wolrd! 你好，世界！";

  return str;
}