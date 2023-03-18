return {
  s("snippet", 
    fmt([=[
  s("{}", 
    fmt([[
      {}
    ]],
      {{i(1)}})
  )
    ]=],
    {i(1, "tab_trigger"), i(2, "body")})
  ),

  s({trig="sysout", wordTrig=true}, {t("System.out.println("),
  f(function(args ,snip) 
	  local res = {}
	  for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
	  return res
	  end), i(1), t(");")}),

  s({trig = "for", wordTrig=true}, fmt([[
  for(int i = 0; i<{}; i++){{
    {}
  }}
  ]], {i(1),i(0)})),

  s({trig = "for(%a)", wordTrig=true, regTrig=true}, fmt([[
  for(int i = 0; {}<{}; i++){{
    {}
  }}
  ]], {f(function(_, snip) return snip.captures[1] end), i(1),i(0)})),
  
  s("main", fmt([[
  package Main;

  class Main{{
    public static void main(String[] args){{
      {}
    }}
  }}
  ]], {i(0)}))

}, 

{

	s({trig="()",wordTrig = false}, {t("("), 
  f(function(args ,snip) 
	  local res = {}
	  for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
	  return res
	  end) ,i(1,""), t(")")}),
	s({trig="{}",wordTrig = false}, {t("{"),
  f(function(args ,snip) 
    local res = {}
    for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
    return res
    end)
  ,i(1,""), t("}")}),
	s({trig="[]",wordTrig = false}, {t("["),
  f(function(args ,snip) 
    local res = {}
    for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
    return res
    end)
  ,i(1,""), t("]")}),
	s({trig="\"\"",wordTrig = false}, {t("\""),
  f(function(args ,snip) 
    local res = {}
    for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
    return res
    end)
  ,i(1,""), t("\"")}),
	s({trig="<>",wordTrig = false}, {t("<"),
  f(function(args ,snip) 
    local res = {}
    for _, ele in ipairs(snip.env.LS_SELECT_RAW) do table.insert(res, ele) end
    return res
    end)
  ,i(1,""), t(">")}),



}
