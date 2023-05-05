local MoonTex = require("MoonTex.context")
return {  s("fig", 
    fmt([[
    \begin{{center}}
      \includegraphics{{Images/{} }}
    \end{{center}}
    ]],
      {i(1, "")})
  ),
  
  s("def", 
    fmt([[
    \definizione{{{}}}{{
      {}
    }}
    ]],
      {i(1),i(0)})
  ),

    s("formula", 
    fmt([[
    \formula{{{}}}{{
      {}
    }}
    ]],
      {i(1),i(0)})
  ),
    s("teo", 
    fmt([[
    \teorema{{{}}}{{
      {}
    }}
    ]],
      {i(1),i(0)})
  ),

  s("ref", 
    fmt([[
      \ref{{{}}}
    ]],
      {i(1)})
  ),

  s("bbox", 
    fmt([[
      \bigbox{{
      {}
      }}
    ]],
      {i(1)})
  ),

  s("vv", 
    fmt([[
      \vec{{{}}}
    ]],
      {i(1)})
  ),

  s("vs", 
    fmt([[
      \vskip3mm
    ]],
      {})
  ),

  s("selected", {t("prova"), f(function(args ,snip) 
  local res = {}
  for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
  return res
  end)}),

  s("visual", 
    fmt([[
    f(function(args ,snip) 
      local res = {{}}
      for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
      return res
      end)
    ]],
      {})
  ),

  s("time", f(function()return os.date("%X") end)),

  s("inc", {t("\\incomprensione{"), f(function() return os.date("%X") end), t("}")}),

  s("cha", 
    fmt([[
      \chapter{{{}}}
    ]],
      {i(1)})
  ),

  s("sec", 
    fmt([[
      \section{{{}}}
    ]],
      {i(1)})
  ),

  s("sub", 
    fmt([[
      \subsection{{{}}}
    ]],
      {i(1)})
  ),

  s("ssub", 
    fmt([[
      \subsubsection*{{{}}}
    ]],
      {i(1)})
  ),
  
  s("i", fmt([[
  \item {}
  i
  ]], {i(1)}),
  {condition = function()  local c = MoonTex.context() return (c == "enumerate" or c == "itemize") end}),

  s("table", 
    fmt([[
    \begin{{table}}[h!]
      \centering
      \begin{{tabular}}{{{}}}
        {}    
      \end{{tabular}}
    \end{{table}}
    ]],
      {i(1), i(0)} )
  ),

  s("bisect", 
    fmt([[
    \begin{{minipage}}[t]{{0.48\textwidth}}
      {}
    \end{{minipage}}
    %
    \begin{{minipage}}[t]{{0.48\textwidth}}
      {}
    \end{{minipage}}
    ]],
      {i(1), i(2)})
  ),
  s({trig = "alpha", wordTrig=false}, t("$ \\alpha $")),
  s({trig = "beta", wordTrig=false}, t("$ \\beta $")),
  s({trig = "gamma", wordTrig=false}, t("$ \\gamma $")),
  s({trig = "delta", wordTrig=false}, t("$ \\delta $")),
  s({trig = "epsilon", wordTrig=false}, t("$ \\varepsilon $")),
  s({trig = "zeta", wordTrig=false}, t("$ \\zeta $")),
  s({trig = "eta", wordTrig=false}, t("$ \\eta $")),
  s({trig = "theta", wordTrig=false}, t("$ \\theta $")),
  s({trig = "iota", wordTrig=false}, t("$ \\iota $")),
  s({trig = "kappa", wordTrig=false}, t("$ \\kappa $")),
  s({trig = "lambda", wordTrig=false}, t("$ \\lambda $")),
  s({trig = "mu", wordTrig=false}, t("$ \\mu $")),
  s({trig = "nu", wordTrig=false}, t("$ \\nu $")),
  s({trig = "xi", wordTrig=false}, t("$ \\xi $")),
  s({trig = "omicron", wordTrig=false}, t("$ \\omicron $")),
  s({trig = "pi", wordTrig=false}, t("$ \\pi $")),
  s({trig = "rho", wordTrig=false}, t("$ \\rho $")),
  s({trig = "sigma", wordTrig=false}, t("$ \\sigma $")),
  s({trig = "tau", wordTrig=false}, t("$ \\tau $")),
  s({trig = "upsilon", wordTrig=false}, t("$ \\upsilon $")),
  s({trig = "phi", wordTrig=false}, t("$ \\phi $")),
  s({trig = "chi", wordTrig=false}, t("$ \\chi $")),
  s({trig = "psi", wordTrig=false}, t("$ \\psi $")),
  s({trig = "omega", wordTrig=false}, t("$ \\omega $")),

  s({trig = "fullplot", wordTrig = true}, fmt([[
\begin{{tikzpicture}}
	\begin{{axis}}[
	xmin={}, xmax={},
	ymin={},ymax={},
	restrict y to domain = {}:{}, domain={}:{}, width=0.98\textwidth, height=0.5\textwidth, grid=major, samples=200,  ylabel=$f(x)$, xlabel=$x$, legend entries={{$ $}}]
	\addplot[black, thick] {{{}}};{}
	\end{{axis}}
\end{{tikzpicture}}
  ]], {i(1,"0"), i(2, "5"), i(3, "-4"), i(4, "4"), rep(3), rep(4), rep(1), rep(2), i(5), i(0)})),

    s({trig = "halfplot", wordTrig = true}, fmt([[
\begin{{tikzpicture}}
	\begin{{axis}}[
	xmin={}, xmax={},
	ymin={},ymax={},
	restrict y to domain = {}:{}, domain={}:{}, width=0.48\textwidth, height=0.48\textwidth, grid=major, samples=200,  ylabel=$f(x)$, xlabel=$x$, legend entries={{$ $}}]
	\addplot[black, thick] {{{}}};{}
	\end{{axis}}
\end{{tikzpicture}}
  ]], {i(1,"0"), i(2, "5"), i(3, "-4"), i(4, "4"), rep(3), rep(4), rep(1), rep(2), i(5), i(0)})),

  s({ trig = "fdot(%-?%d+%.?%d*)", regTrig=true },
    f(function(_ ,snip)
    local res = nil
    for _, ele in ipairs(snip.env.LS_SELECT_RAW) do
          if res== nil then res = ele else res=res..ele end
    end
      local number = snip.captures[1]:sub(1,1) == "-" and "("..snip.captures[1]..")" or snip.captures[1]
      return {res:match("%s*(.*)"),"\\node [blackdot] at ("..snip.captures[1]..", {"..res:match("{(.*)}"):gsub("x", number).."}) {};"}
    end),
    {condition = function()  local env = MoonTex.context() return env == "axis" or env == "tikzpicture" or env == "circuitikz"end }),

  s({ trig = "fedot(%-?%d+%.?%d*)", regTrig=true },
    f(function(_ ,snip)
    local res = nil
    for _, ele in ipairs(snip.env.LS_SELECT_RAW) do
          if res== nil then res = ele else res=res..ele end
    end
      local number = snip.captures[1]:sub(1,1) == "-" and "("..snip.captures[1]..")" or snip.captures[1]
      return {res:match("%s*(.*)"),"\\node [whitedot] at ("..snip.captures[1]..", {"..res:match("{(.*)}"):gsub("x", number).."}) {};"}
    end),
    {condition = function()  local env = MoonTex.context() return env == "axis" or env == "tikzpicture" or env == "circuitikz"end }),

  s({ trig = "fcord(%-?%d+%.?%d*)", regTrig=true },
    {f(function(_ ,snip)
    local res = nil
    for _, ele in ipairs(snip.env.LS_SELECT_RAW) do
          if res== nil then res = ele else res=res..ele end
    end
      return {res:match("%s*(.*)"),"\\coordinate ("}
    end), i(1),
    f(function(_ ,snip)
    local res = nil
    for _, ele in ipairs(snip.env.LS_SELECT_RAW) do
          if res== nil then res = ele else res=res..ele end
    end
      local number = snip.captures[1]:sub(1,1) == "-" and "("..snip.captures[1]..")" or snip.captures[1]
      return ") at ("..snip.captures[1]..", {"..res:match("{(.*)}"):gsub("x", number).."}) {};"
    end)
    },
    {condition = function()  local env = MoonTex.context() return env == "axis" or env == "tikzpicture" or env == "circuitikz"end }),

  s("dot", fmt([[\node [blackdot] at ({},{}){{}};]], {i(1), i(2)}), {condition = function()  local env = MoonTex.context() 
    return env == "axis" or env == "tikzpicture" or env == "circuitikz"end }),
  s("edot", fmt([[\node [whitedot] at ({},{}){{}};]], {i(1), i(2)}), {condition = function()  local env = MoonTex.context() 
    return env == "axis" or env == "tikzpicture" or env == "circuitikz"end }),
  s("shift", fmt([[[shift={{(axis direction cs:{},{})}}] {}]], {i(1), i(2), i(3)}), {condition = function()  local env = MoonTex.context() 
    return env == "axis" or env == "tikzpicture" or env == "circuitikz"end }),
  s("draw", fmt([[\draw ({})--({});]], {i(1), i(2)}), {condition = function()  local env = MoonTex.context() 
    return env == "axis" or env == "tikzpicture" or env == "circuitikz" end }),
  s("dashed", fmt([[\draw [dashed] ({})--({});]], {i(1), i(2)}), {condition = function()  local env = MoonTex.context() 
    return env == "axis" or env == "tikzpicture" or env == "circuitikz" end }),
  s("dotted", fmt([[\draw [dotted] ({})--({});]], {i(1), i(2)}), {condition = function()  local env = MoonTex.context() 
    return env == "axis" or env == "tikzpicture" or env == "circuitikz" end }),

  s({ trig = "addnodes/(.*)", regTrig=true },
  f(function(_ ,snip) 
    local res = {}
    for _, ele in ipairs(snip.env.LS_SELECT_DEDENT) do table.insert(res,ele) end

      table.insert(res, "%")

    for _, ele in ipairs(snip.env.LS_SELECT_RAW) do
        table.insert(res,"\\node ["..snip.captures[1].."] at "..ele:match("(%(.*%)).*at").." {};")
    end
    return res
    end),
    {condition = function()  local env = MoonTex.context() return env == "axis" or env == "tikzpicture" end }),
  s({trig = "nn", wordTrig=true}, {t("\\node "), i(0), t(" {};")},{condition = function()  local env = MoonTex.context() return env == "axis" or env == "tikzpicture" or env == "circuitikz" end }),
  s({trig = "shift", wordTrig=true}, {t("\\[shift={("), i(1), t(")}] ")},{condition = function()  local env = MoonTex.context() return env == "axis" or env == "tikzpicture" or env == "circuitikz" end }),

},

{

  s("MC", 
    fmt([[
    \mathcal{{{}}}
    ]],
      {i(1)}),
    {condition = function() return MoonTex.context() == "math" end }
  ),

  s("ll", 
    fmt([[
     \label{{{}}} 
    ]],
      {i(1)})
  ),

  s("BB", 
    fmt([[
      \mathbb{{{}}}
    ]],
      {i(1)})
  ),


  s("bin", 
    fmt([[
      \binom{{{}}}{{{}}}
    ]],
      {i(1), i(2)}),
    {condition = function() return MoonTex.context() == "math" end }
  ),
  s("ge", 
    fmt([[
      \ge 
    ]],
    {}),
    {condition = function() return MoonTex.context() == "math" end }
  ),

  s("le", 
    fmt([[
      \le 
    ]],
      {}),
    {condition = function() return MoonTex.context() == "math" end }
  ),

  s("NN", 
    fmt([[
      \N 
    ]],
      {})
  ),

  s("RR", 
    fmt([[
      \R 
    ]],
      {})
  ),

  s("CC", 
    fmt([[
      \C 
    ]],
      {})
  ),

  s("QQ", 
    fmt([[
      \Q 
    ]],
      {})
  ),

  s("ZZ", 
    fmt([[
      \Z 
    ]],
      {})
  ),

  s("neq", 
    fmt([[
      \neq 
    ]],
      {}),
        {condition = function() return MoonTex.context=="math" end}
  ),

  s("tc", 
    fmt([[
       \text{{ t.c. }} 
    ]],
      {})
  ),

  s("beg", 
    fmt([[
      \begin{{{}}}
        {}{}
      \end{{{}}}
    ]],
      {i(1),
      f(function(args ,snip) 
        local res = {}
        for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
        return res
        end),
        i(0),
      rep(1)} )
  ),

    
  s("cc", 
    fmt([[
    \begin{{center}}
      {}{} 
    \end{{center}}]],
      {f(function(args ,snip) 
        local res = {}
        for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
        return res
        end)
        ,i(1)})
  ),

  s("tb", {t("\\textbox{"), 
  f(function(args ,snip) 
    local res = {}
    for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
    return res
    end),
    i(1), t("}")}),


  s("bbf",
    fmt([[
      \textbf{{{}{}}}
    ]],
      {f(function(args ,snip) 
        local res = {}
        for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
        return res
        end),
        i(1)
      })
  ),

  s("iit", 
    fmt([[
      \textit{{{}{}}}
    ]],
      {f(function(args ,snip) 
        local res = {}
        for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
        return res
        end),
        i(1)
      })
  ),

  s("uul", 
    fmt([[
      \underline{{{}{}}}
    ]],
      {f(function(args ,snip) 
        local res = {}
        for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
        return res
        end),
        i(1)
      })
  ),

  s("hr", fmt([[\\abs

  ]], {})),

  s("abs",
    fmt([[
      \left|{}{}\right|
    ]],
      {f(function(args ,snip) 
        local res = {}
        for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
        return res
        end),
        i(1)}),
{condition = function() return MoonTex.context() == "math" end }
  ),

  s("enum", 
    fmt([[
    \begin{{enumerate}}
      \item {}
      i{}
    \end{{enumerate}}
    ]],
      {i(1), i(0)})
  ),

  s({trig="item", wordTrig=true}, 
    fmt([[
    \begin{{itemize}}
      \item {}
      i{}
    \end{{itemize}}
    ]],
      {i(1), i(0)})
  ),

  s("km", {t("$ "), i(1), t(" $")}),
  
  s("dm", 
    fmt([[
    \[
    {}{}
    \]
    ]],
      {f(function(args ,snip) 
        local res = {}
        for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
        return res
        end),
        i(1)})
  ),

  s("ali", 
    fmt([[
    \begin{{align*}}
      {}{}
    \end{{align*}}
    ]],
      {f(function(args ,snip) 
        local res = {}
        for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
        return res
        end),
        i(1)})
  ),

  s("//", 
    fmt([[
      \frac{{{}}}{{{}}}
    ]],
      {i(1),i(2)}),
    {condition = function()return MoonTex.context() == "math" end}
  ),

  s("==", t("&="),{condition = function()return MoonTex.context() == "align*" end}),
  s("!=", t("\\neq ")),
  s("ceil", 
    fmt([[
      \left\lceil {} \right\rceil
    ]],
      {i(1)})
  ),
  s("floor", 
    fmt([[
      \left\lflooor {} \right\rightfloor
    ]],
      {i(1)})
  ),
  s("pmat", 
    fmt([[
    \begin{{pmatrix}}
      {}
    \end{{pmatrix}}
    ]],
      {i(0)})
  ),
  s("bmat", 
    fmt([[
    \begin{{bmatrix}}
      {}
    \end{{bmatrix}}
    ]],
      {i(0)})
  ),
	s({trig="()",wordTrig = false, priority = 1001}, {t("\\left("), 
  f(function(args ,snip) 
	  local res = {}
	  for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
	  return res
	  end) ,i(1,""), t("\\right)")},
    {condition = function() return MoonTex.context() == "math" end }
    ),
	s({trig="[]",wordTrig = false, priority = 1001}, {t("\\left["), 
  f(function(args ,snip) 
	  local res = {}
	  for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
	  return res
	  end) ,i(1,""), t("\\right]")},
    {condition = function() return MoonTex.context() == "math" end }
    ),
	s({trig="{}",wordTrig = false, priority = 1001}, {t("\\left{"), 
  f(function(args ,snip) 
	  local res = {}
	  for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
	  return res
	  end) ,i(1,""), t("\\right}")},
    {condition = function() return MoonTex.context() == "math" end }
    ),
	s({trig="<>",wordTrig = false, priority = 1001}, {t("\\left<"), 
  f(function(args ,snip) 
	  local res = {}
	  for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
	  return res
	  end) ,i(1,""), t("\\right>")},
    {condition = function() return MoonTex.context() == "math" end }
    ),
	s({trig="set",wordTrig = true}, {t("\\left\\{"), 
  f(function(args ,snip) 
	  local res = {}
	  for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
	  return res
	  end) ,i(1,""), t("\\right\\}")},
    {condition = function() return MoonTex.context() == "math" end }
    ),

  s("OH", 
    fmt([[
      \overline{{{}{}}}
    ]],
      {f(function(args ,snip) 
        local res = {}
        for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
        return res
        end),
        i(1)})
  ),

  s("sum", 
    fmt([[
    \sum_{{k={}}}^{{{}}} {}
    ]],
      {i(1, "1"), i(2, "\\infty"), i(0, "a_k x^k")}),
      {condition = function() return MoonTex.context() == "math" end }),
  s("lim", 
    fmt([[
    \lim_{{{} \to {}}} {}
    ]],
      {i(1, "x"), i(2, "\\infty"), i(0, "f(x)")}),
      {condition = function() return MoonTex.context() == "math" end }),
  s("prod", 
    fmt([[
    \prod_{{k={}}}^{{{}}} {}
    ]],
      {i(1, "1"), i(2, "\\infty"), i(0, "a_k x^k")}),
      {condition = function() return MoonTex.context() == "math" end }),

  s({trig="sq",wordTrig=false}, 
    fmt([[
      \sqrt{{{}{}}}
    ]],
      {f(function(args ,snip) 
        local res = {}
        for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
        return res
        end),
        i(1)}),
      {condition = function() return MoonTex.context() == "math" end }),

  s({trig="sr",wordTrig=false}, t("^2 "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig="cb",wordTrig=false}, t("^3 "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig="td", wordTrig=false}, {t("^{"), i(1), t("}")},{condition = function() return MoonTex.context() == "math" end }),
  s({trig="__",wordTrig=false}, {t("_{"), i(1), t("}")}),
  s({trig="inf",wordTrig=false}, t("\\infty "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig="EE",wordTrig=false}, t("\\exists "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig="forall",wordTrig=false}, t("\\forall "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig="xx",wordTrig=false}, t("\\times "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig="...",wordTrig=false}, t("\\ldots "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig="**",wordTrig=false}, t("\\cdot "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig="norm",wordTrig=false}, {t(" \\|"),f(function(args ,snip) 
    local res = {}
    for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
    return res
    end), i(1), t("\\|")}, {condition = function() return MoonTex.context() == "math" end }),
  s({trig="dint",wordTrig=false}, 
    fmt([[
    \int_{{{}}}^{{{}}} {} \; dx
    ]],
      {i(1, "a"),i(2, "b"),i(3, "f(x)")}),
    {condition = function() return MoonTex.context() == "math" end }
  ),
  s({trig="inv",wordTrig=false}, t("^{-1}"), {condition = function() return MoonTex.context() == "math" end }),
  s({trig="inn",wordTrig=false, priority = 1001}, t("\\in "), {condition = function() return MoonTex.context() == "math" end }),
  s({trig="uu",wordTrig=false}, t("\\cup "), {condition = function() return MoonTex.context() == "math" end }),
  s({trig="UU",wordTrig=false}, t("\\bigcup "), {condition = function() return MoonTex.context() == "math" end }),
  s({trig="nn",wordTrig=false}, t("\\cap "), {condition = function() return MoonTex.context() == "math" end }),
  s({trig="eset",wordTrig=false}, t("\\emptyset "), {condition = function() return MoonTex.context() == "math" end }),
  s("tt", {t("\\text{ "), f(function(args ,snip) 
    local res = {}
    for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
    return res
    end),
    i(1), t(" }")}, {condition = function() return MoonTex.context() == "math" end }),
  s("case", 
    fmt([[
      \begin{{cases}}
        {}
      \end{{cases}}
    ]],
      {i(1)})
  ),
  s("rarr", t("\\rightarrow ")),
  s("larr", t("\\leftarrow ")),
  s("Rarr", t("\\Rightarrow ")),
  s("Rarr", t("\\Leftarrow ")),
  s("iif", t("\\Leftrightarrow ")),
  s("iif", t("\\Leftrightarrow ")),
  s("qu", t("\\quad "), {condition = function() return MoonTex.context()=="math" end}),
  s("to", t("\\to "), {condition = function() return MoonTex.context()=="math" end}),
  s("not", t("\\not "), {condition = function() return MoonTex.context()=="math" end}),

  s({trig = "vv([a-zA-Z]) ", regTrig = true}, {t("\\vec{"),f(function(_, snip) return snip.captures[1] end), t("}")}),
  s("ub", {t("\\underbrace{"), 
  f(function(args ,snip) 
    local res = {}
    for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
    return res
    end),
    i(1), t("}")},
    {condition = function() return MoonTex.context() == "math" end }),

  --  s("comm", {f(function(text, snip)
  --  local comment_tokens = {lua = "--", cpp = "//", latex = "%"}
  --  local curr_token = comment_tokens[vim.bo.filetype]==nil and "" or comment_tokens[vim.bo.filetype]
  --  if next(snip.env.LS_SELECT_RAW)==nil then return curr_token end
  --  local lines = {}
  --  for _, x in ipairs(snip.env.LS_SELECT_RAW) do table.insert(lines, curr_token..x) end
  --  return lines
  --  end)})

  -- snippet per la \frac{}{}
  s({trig = "(%-?%d+)/", regTrig = true, wordTrig=false}, {t("\\frac{"), f(function(_, snip) return snip.captures[1] end), t("}{"), i(1), t("}")},
  {condition = function() return MoonTex.context() == "math" end }
    ),
  s({trig = "(%-?%(.+%))/", regTrig = true, wordTrig=false}, {t("\\frac{"), f(function(_, snip) return snip.captures[1] end), t("}{"), i(1), t("}")},
  {condition = function() return MoonTex.context() == "math" end }
    ),
  s({trig = "(%-?\\left%(.*\\right%))/", regTrig = true, wordTrig=false, priority = 1002}, {t("\\frac{"), f(function(_, snip) return snip.captures[1] end), t("}{"), i(1), t("}")},
  {condition = function() return MoonTex.context() == "math" end }
    ),
  s({trig = "(%-?%d+\\?%a*%^?%d*)/", regTrig = true, priority=1001, wordTrig=false}, {t("\\frac{"), f(function(_, snip) return snip.captures[1] end), t("}{"), i(1), t("}")},
  {condition = function() return MoonTex.context() == "math" end }
    ),
  s({trig = "(%-?%d*\\?%a+%^?%d*)/", regTrig = true, priority=1001, wordTrig=false}, {t("\\frac{"), f(function(_, snip) return snip.captures[1] end), t("}{"), i(1), t("}")},
  {condition = function() return MoonTex.context() == "math" end }
    ),
  s({trig = "(%-?%d*\\?%a*%^%d+)/", regTrig = true, priority=1001, wordTrig=false}, {t("\\frac{"), f(function(_, snip) return snip.captures[1] end), t("}{"), i(1), t("}")},
  {condition = function() return MoonTex.context() == "math" end }
    ),
  s({trig = "(%-?%d*\\?%a*%^{.*})/", regTrig = true, priority=1001, wordTrig=false}, {t("\\frac{"), f(function(_, snip) return snip.captures[1] end), t("}{"), i(1), t("}")},
  {condition = function() return MoonTex.context() == "math" end }
    ),
  s({trig = "(%-?\\frac{.*}{.*})/", regTrig = true, priority=1001, wordTrig=false}, {t("\\frac{"), f(function(_, snip) return snip.captures[1] end), t("}{"), i(1), t("}")},
  {condition = function() return MoonTex.context() == "math" end }
    ),


  s({trig = "(%a)(%d)", regTrig = true}, {f(function(_, snip) return snip.captures[1] end), t("_"), f(function(_, snip) return snip.captures[2] end)},
  {condition = function() return MoonTex.context() == "math" end }
    ),


  s({trig = "alpha", wordTrig=true, priority=1001}, t("\\alpha "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "beta", wordTrig=true, priority=1001}, t("\\beta "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "gamma", wordTrig=true, priority=1001}, t("\\gamma "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "delta", wordTrig=true, priority=1001}, t("\\delta "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "epsilon", wordTrig=true, priority=1001}, t("\\epsilon "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "zeta", wordTrig=true, priority=1001}, t("\\zeta "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "eta", wordTrig=true, priority=1001}, t("\\eta "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "theta", wordTrig=true, priority=1001}, t("\\theta "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "iota", wordTrig=true, priority=1001}, t("\\iota "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "kappa", wordTrig=true, priority=1001}, t("\\kappa "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "lambda", wordTrig=true, priority=1001}, t("\\lambda "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "mu", wordTrig=true, priority=1001}, t("\\mu "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "nu", wordTrig=true, priority=1001}, t("\\nu "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "xi", wordTrig=true, priority=1001}, t("\\xi "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "omicron", wordTrig=true, priority=1001}, t("\\omicron "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "pi", wordTrig=true, priority=1001}, t("\\pi "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "rho", wordTrig=true, priority=1001}, t("\\rho "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "sigma", wordTrig=true, priority=1001}, t("\\sigma "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "tau", wordTrig=true, priority=1001}, t("\\tau "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "upsilon", wordTrig=true, priority=1001}, t("\\upsilon "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "phi", wordTrig=true, priority=1001}, t("\\phi "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "chi", wordTrig=true, priority=1001}, t("\\chi "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "psi", wordTrig=true, priority=1001}, t("\\psi "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig = "omega", wordTrig=true, priority=1001}, t("\\omega "),{condition = function() return MoonTex.context() == "math" end }),
  s({trig="minus", wordTrig=true}, t("\\setminus "), {condition = function() return MoonTex.context() == "math" end }),
  s({trig="inn", wordTrig=true}, t("\\in "), {condition = function() return MoonTex.context() == "math" end }),
  s({trig="neq", wordTrig=true}, t("\\neq "), {condition = function() return MoonTex.context() == "math" end }),
  s({trig="mod", wordTrig=true}, t("\\mod "), {condition = function() return MoonTex.context() == "math" end }),
  s({trig="equiv", wordTrig=true}, t("\\equiv "), {condition = function() return MoonTex.context() == "math" end }),
  s({trig="sim", wordTrig=true}, t("\\sim "), {condition = function() return MoonTex.context() == "math" end }),

  }
