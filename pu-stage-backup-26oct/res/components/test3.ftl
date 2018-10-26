<select id="yup" onchange='alert(this.selectedIndex); if (this.selectedIndex == "0") document.getElementById("yup").style.color="grey"; else document.getElementById("yup").style.color="black";'>
  <#list text.format("microsoft.country_list")?split(",") as code>
    <option value="${code}">${text.format("microsoft.msg_event_country." + code + ".title")}
  </#list>
</select></option>

<style>
  #yup option {
    color: red;
  }
  #yup option:first-child {
    color: blue;
  }
</style>