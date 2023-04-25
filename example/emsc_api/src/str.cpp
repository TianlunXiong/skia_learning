#include "em_macro.hpp"
#include <iostream>

EM_PORT_API(const char*) get_str() {
  static const char str[] = "Hello, wolrd! 你好，世界！";

  return str;
}

EM_PORT_API(void) print_str(char* str) {
  std::cout << str << std::endl;
}