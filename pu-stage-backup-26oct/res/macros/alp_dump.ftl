<#-- Implemented: Alpay Bayraktar -->

<#-- alp-dump.ftl
  --
  -- Generates tree representations of data model items.
  --
  -- Usage:
  -- <#include "alp_dump.ftl">
  --
  -- <#assign foo = something.in["your"].data[0].model />
  --
  -- <@dump foo "foo"/>
  --
  -- This will also generate the proper html for folding.
  -->


<#-- The BLACK_LIST contains bad hash keys. Any hash key which matches a
  -- BLACK_LIST entry is prevented from being displayed.
  -->
<#assign BLACK_LIST = ["class"] />
<#assign DUMP_ERR_MSG_1 = "!!! Processing error, access the variable separately to see the exception. !!!" />
<#assign dump_hits = 0 />
<#assign dump_depth = 0 />
<#assign max_depth_reached = false />
<#assign MAX_DUMP_HITS = 200000 />
<#assign MAX_DUMP_DEPTH = 15 />

<#--
     Test:

     <@dump {"o" : "one", "t" : "two", "sub": [ "three", "four", ["five", "six"] ]}/>
     <@dump />
     <@dump [] />
     <@dump {} />
     <@dump [[],[]] />
     <@dump { "" : {} } />

-->

<#--
  -- The main macro.
  -->
<script>
  function dump_show_hide(id)
  {
  	var o = document.getElementById(id);
    if (!o) return;
    if (! o.style) return;
    if (o.style.display == "")
    {
      o.style.display = "none"
    }
    else
    {
      o.style.display = "";
    }
  }

  function dump_show(id)
  {
  	var o = document.getElementById(id);
    if (!o) return;
    if (! o.style) return;
    o.style.display = "";
  }

  function dump_hide(id)
  {
  	var o = document.getElementById(id);
    if (!o) return;
    if (! o.style) return;
    o.style.display = "none";
  }
</script>

<#-- dump
  --
  -- HTML decoreted data dumper.
  -->
<#macro dump data="null" data_name="variable" input_depth=-1>

<#local dump_guid = "dump_${random_ex()}_" />
<div ondblclick="dump_show_hide('${dump_guid}${data_name}')" style="background-color:#FFF8DC">
<span onclick="dump_show_hide('${dump_guid}${data_name}')" />[<font style='color:#ff0000'>+/-</font>] Dump ${data_name}<br /> </span>
<pre id="${dump_guid}${data_name}" style="display:none; background-color:#FFFFF0">

  <@dump_raw data, input_depth/>

</pre>
</div>

</#macro>


<#-- dump_raw
  --
  -- Generates tree representations of data model items.
  --
  -- Usage:
  -- <#import "dump.ftl">
  --
  -- <#assign foo = something.in["your"].data[0].model />
  --
  -- <@dump_raw foo />
  --
  -- When used within html pages you've to use <pre>-tags to get the wanted
  -- result:
  -- <pre>
  -- <@dump_raw foo />
  -- <pre>
  -->

<#-- dump_raw
  --
  -- Simple object dumper.
  -->
<#macro dump_raw data input_depth=-1>
<#if (input_depth > -1)>
<#local saved_depth = MAX_DUMP_DEPTH />
<#assign MAX_DUMP_DEPTH = input_depth />  
</#if>
<#assign dump_hits = 0 />
<#assign max_depth_reached = false />
<#assign dump_depth = 0 />
<#if data?is_enumerable>
(root)
<@printList data,[] />
<#elseif data?is_hash_ex>
(root)
<@printHashEx data,[] />
<#else>
<#attempt>
<#if (data == "null")>
${data}
<#else>
"${data}"
</#if>
<#recover>
<@printItem data,[], "" />
</#attempt>
</#if>
<#if (dump_hits == MAX_DUMP_HITS)>

- Not all data shown, as the maximum print nodes (${MAX_DUMP_HITS}) reached.
- To increase the number of nodes, change MAX_DUMP_HITS in "alp-dump" template.
</#if>
<#if (max_depth_reached)>

- Not all data shown, as the maximum depth of dump (${MAX_DUMP_DEPTH}) reached.
- To increase the depth, change MAX_DUMP_DEPTH in "alp-dump" template.
</#if>
<#if (input_depth > -1)>
<#assign MAX_DUMP_DEPTH = saved_depth />  
</#if>  
</#macro>

<#-- Note: Private helper macros. It is not recommended to use these macros
  -- from outside the macro library.
  -->

<#-- printList
  --
  -- Leave unindented, without blank lines and without trailing whitespace.
  -->
<#macro printList list has_next_array>
<#if (dump_depth < MAX_DUMP_DEPTH)>
<#assign dump_depth = dump_depth + 1 />
<#local counter=0 />
<#list list as item>
<#if (dump_hits < MAX_DUMP_HITS)>
<#list has_next_array+[true] as has_next><#if !has_next>    <#else>  | </#if></#list>
<#list has_next_array as has_next><#if !has_next>    <#else>  | </#if></#list><#t>
<#attempt>
<#t><@printItem item?if_exists,has_next_array+[item_has_next], counter />
<#recover>
<#t><@printItem DUMP_ERR_MSG_1,has_next_array+[item_has_next], counter />
</#attempt>
<#local counter = counter + 1/>
</#if><#-- dump_hits -->
</#list>
<#assign dump_depth = dump_depth - 1 />
<#else>
<#assign max_depth_reached = true />
</#if><#-- dump_depth -->
</#macro>

<#-- printHashEx
  --
  -- Leave unindented, without blank lines and without trailing whitespace.
  -->
<#macro printHashEx hash has_next_array>
<#if (dump_depth < MAX_DUMP_DEPTH)>
<#assign dump_depth = dump_depth + 1 />
<#list hash?keys as key>
<#if (dump_hits < MAX_DUMP_HITS)>
<#list has_next_array+[true] as has_next><#if !has_next>    <#else>  | </#if></#list>
<#list has_next_array as has_next><#if !has_next>    <#else>  | </#if></#list><#t>
<#if !(key??)>
<#t><@printItem "null key",has_next_array+[key_has_next], "null" />
<#elseif !(hash??)>
<#t><@printItem "null hash",has_next_array+[key_has_next], key />
<#else>
<#attempt>
<#if (hash[key]??)>
<#t><@printItem hash[key]?if_exists,has_next_array+[key_has_next], key />
<#else>
<#t><@printItem "null hash[key]",has_next_array+[key_has_next], key />
</#if>
<#recover>
<#t><@printItem DUMP_ERR_MSG_1,has_next_array+[key_has_next], key />
</#attempt>
</#if>
</#if><#-- dump_hits -->
</#list>
<#assign dump_depth = dump_depth - 1 />
<#else>
<#assign max_depth_reached = true />
</#if><#-- dump_depth -->
</#macro>


<#-- printItem
  --
  -- Leave unindented, without blank lines and without trailing whitespace.
  -->
<#macro printItem item has_next_array key>
<#assign go_deep = (dump_depth < MAX_DUMP_DEPTH) />
<#if (dump_hits < MAX_DUMP_HITS)>
<#assign dump_hits = dump_hits + 1 />
<#if item?is_method>
  +- ${key} = ?? (method)
<#elseif item?is_enumerable>
<#if go_deep>
  +- ${key}
  <@printList item, has_next_array /><#t>
<#else>
<#assign max_depth_reached = true />
  +- ${key} = ?? (list) !!! at max depth !!!
</#if><#-- go_deep -->
<#elseif item?is_hash_ex && omit(key?string)><#-- omit bean-wrapped java.lang.Class objects -->
  +- ${key} (omitted)
<#elseif item?is_hash_ex>
<#if go_deep>
  +- ${key}
  <@printHashEx item, has_next_array /><#t>
<#else>
<#assign max_depth_reached = true />
  +- ${key} = ?? (hash_ex) !!! at max depth !!!
</#if><#-- go_deep -->
<#elseif item?is_number>
  +- ${key} = ${item}
<#elseif item?is_string>
  +- ${key} = "${item}"
<#elseif item?is_boolean>
  +- ${key} = ${item?string}
<#elseif item?is_date>
  +- ${key} = ${item?string("yyyy-MM-dd HH:mm:ss zzzz")}
<#elseif item?is_transform>
  +- ${key} = ?? (transform)
<#elseif item?is_macro>
  +- ${key} = ?? (macro)
<#elseif item?is_hash>
  +- ${key} = ?? (hash)
<#elseif item?is_node>
  +- ${key} = ?? (node)
<#else>
  +- ${key} = ?? (something)
</#if>
</#if><#-- dump_hits -->
</#macro>

<#function omit key>
    <#local what = key?lower_case>
    <#list BLACK_LIST as item>
        <#if what?index_of(item) gte 0>
            <#return true>
        </#if>
    </#list>
    <#return false>
</#function>


<#-- Raw dump examples and testing:

    <#assign data = ["one", "two"] />
    <@printList data,[] />

    <#assign data = {"o" : "one", "t" : "two"} />
    <@printHashEx data,[] />

    <@printItem "one",[], "" />


    <@dump_raw ["one", "two"] />

    <@dump_raw {"o" : "one", "t" : "two"} />

    <@dump_raw "something" />


    <@dump_raw {"o" : "one", "t" : "two", "sub": [ "three", "four", ["five", "six"] ]} />
-->

      
      
      
      
      
      
      
      
      
      
<#-- Implemented: Alpay Bayraktar -->
<#-- 
     Usage: 
     
     Simple random generator (fater):
     
     ${random()} 
     
     or 
     
     Complex random generator (slower):
     
     ${random_ex()} 
-->
  
<#-- 
     Test:
     
     ${random()}      
     ${random_ex()} 
-->
  
  
<#-- Simple random generator (faster) -->
  
<#assign rnd="0.${turnoverstr(.now?long?c?string)}"?number />

<#function random >
<#local h="0.${turnoverstr(.now?long?c?string)}" />
<#local r=h?number + rnd />
<#if (r >= 1)>
<#local r=r-1 />
</#if>
<#assign rnd=r />
<#return r/>
</#function>

<#function turnoverstr str >
<#local l = str?length />
<#local r = ""/>
<#list 1..l as i>
<#local r = r+str?substring(l-i,l-i+1)/>
</#list>
<#return r/>
</#function>
  

<#assign bits=32 />
<#assign m_w="0.${.now?long?c?string}"?number />
<#assign m_z="0.${turnoverstr(.now?long?c?string)}"?number />


<#-- Complex random generator (slower) -->  
  
  
<#function random_ex >
<#local h= intdectobin(65535) />
<#local mzh= fdectobin("0.${turnoverstr(.now?long?c?string)}"?number) />
<#local mwh= fdectobin(m_w) />
<#local z= 36969 * intbintodec(andmultiply(mzh, h)) + intbintodec( shiftr(mzh, bits/2) ) />;
<#local w= 18000 * intbintodec(andmultiply(mwh, h)) + intbintodec( shiftr(mwh, bits/2) ) />;
<#local r= intbintodec( shiftl( intdectobin(z), bits/2 ) ) + w />
<#assign m_w=m_z />
<#assign m_z=("0." + turnoverstr(r?c?string))?number />
<#return m_z/>
</#function>

<#function turnoverstr str >
<#local l = str?length />
<#local r = ""/>
<#list 1..l as i>
<#local r = r+str?substring(l-i,l-i+1)/>
</#list>
<#return r/>
</#function>

<#function shiftl b n >
<#local l = b?length />
<#local r = ""?left_pad(bits, "0")/>
<#if (l > n)>
<#local h = b?substring(n,l)/>
<#local r = h + ""?right_pad(n, "0")/>
</#if>
<#return r />
</#function>

<#function shiftr b n >
<#local l = b?length />
<#local r = ""?left_pad(bits, "0")/>
<#if (l > n)>
<#local h = b?substring(0,l-n)/>
<#local r = ""?left_pad(n, "0") + h/>
</#if>
<#return r />
</#function>

<#function fbintodec b >
<#local h = 2 />
<#local r = 0 />
<#local l = b?length />
<#list 0..l-1 as i>
<#if (b?substring(i, i+1) == "1") >
<#local r = r + 1/h />
</#if>
<#local h = h * 2 />
</#list>
<#return r />
</#function>

<#function fdectobin d >
<#local r = ""/>
<#local h = 0/>
<#list 0..bits-1 as i>
<#local h = d*2 />
<#if (h == 1)>
<#local r = (r + "1")?right_pad(bits, "0")/>
<#break/>
<#elseif (h > 1) >
<#local r = (r + "1")/>
<#local d = h-1 />
<#else>
<#local d = h />
<#local r = (r + "0")/>
</#if>
</#list>
<#local r = r?right_pad(bits, "0")/>
<#return r />
</#function>

<#function intdectobin d >
<#local r = ""/>
<#local h = 0/>
<#list 0..bits as i>
<#local hh = d%2 />
<#local h = (d/2)?int />
<#local d = d - h />
<#if (h == 0)>
<#local r = (hh?string + r )?left_pad(bits, "0")/>
<#break/>
<#else>
<#local r = hh?string + r/>
</#if>
</#list>
<#local r = r?left_pad(bits, "0")/>
<#return r />
</#function>

<#function intbintodec b >
<#local h = 1 />
<#local r = 0 />
<#local l = b?length />
<#list 1..l as i>
<#if (b?substring(l-i, l-i+1) == "1") >
<#local r = r + h />
</#if>
<#local h = h * 2 />
</#list>
<#return r />
</#function>

<#function andmultiply a b >
<#local a = a?left_pad(bits, "0")/>
<#local b = b?left_pad(bits, "0")/>
<#local r = "" />
<#local l = a?length />
<#list 0..l-1 as i>
<#if (a?substring(i, i+1) == b?substring(i, i+1)) >
<#local r = (r + "1")/>
<#else>
<#local r = (r + "0")/>
</#if>
</#list>
<#return r />
</#function> 

