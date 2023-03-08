return{	s("ifst", t([[std::ifstream in("input.txt");]])),

  s("lnode", fmt([[  
  struct {}
    int *next;
    {} (int value, $1 *next) : value(value), next(next) {{}};
    {} (int value) : value(value), next(nullptr) {{}};
    {} () : value(-1), next(nullptr) {{}};
    ]],
    {i(1,"node"), rep(1), rep(1), rep(1)} )),

  s("main", fmt([[
    #include<iostream>
    #include<fstream>
    int main(int argc, char *argv[]){{
      {}
    }}]],
    {i(0,"")} )),

  s("cout", 
    fmt([[std::cout << {} << std::endl;]],
    {i(1)})
  ),

  s("struct", 
    fmt([[
    struct {} {{
      {} (){{}}
    }};
    ]],
      {i(1), rep(1)})
  ),
},
{
  }
