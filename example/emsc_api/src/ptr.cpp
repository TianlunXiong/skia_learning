#include <emscripten.h>
#include <iostream>
#include "em_macro.hpp"

int global_foo = 888;

EM_PORT_API(int*) get_global_foo_ptr()
{
  return &global_foo;
}


EM_PORT_API(int*) fibonacci(int count) {
  if (count <= 0) return NULL;

  int *re = (int *)malloc(count * 4);
  if (NULL == re)
  {
    std::cout << ("Not enough memory.\n");
    return NULL;
  }

  re[0] = 1;
  int i0 = 0, i1 = 1;
  for (int i = 1; i < count; i++)
  {
    re[i] = i0 + i1;
    i0 = i1;
    i1 = re[i];
  }

  return re;
}