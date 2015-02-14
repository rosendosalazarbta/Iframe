using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Web.Script.Serialization;

public partial class readFile : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e){
       
    }

    public string Content(){
        var request = HttpContext.Current.Request.Files["upload_field"];
        _Object obj = new _Object();

        if (request != null) {
            using (StreamReader reader = new StreamReader(request.InputStream)){
                bool bandera = true;
                while (reader.Peek() >= 0){
                    if (bandera){
                        obj.line1 = reader.ReadLine();
                        bandera = false;
                    }
                    else obj.lines += reader.ReadLine();
                }
            }
        } 

        return ConvertJSON(obj);;
    }

    public string ConvertJSON(_Object obj){
        JavaScriptSerializer JSON = new JavaScriptSerializer();
        return JSON.Serialize(obj);
    }

}

public class _Object{
    private string Line1;
    private string Lines;
    public string line1 {
        get { return Line1; }
        set { Line1 = value; }
    }
    public string lines{
        get { return Lines; }
        set { Lines = value; }
    }
}