using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;

namespace Pkck5
{
    public class XmlUtilities
    {

        public FileInfo XmlFile { get; set; }
        public FileInfo[] SchemaFile { get; set; }
        XmlSerializer Serializer { get; set; }

        public XmlUtilities(string xmlFile, string[] schemaFile)
        {
            XmlFile = new FileInfo(xmlFile);
            SchemaFile = new FileInfo[3];
            SchemaFile[0] = new FileInfo(schemaFile[0]);
            SchemaFile[1] = new FileInfo(schemaFile[1]);
            SchemaFile[2] = new FileInfo(schemaFile[2]);
            Serializer = new XmlSerializer(typeof(płytoteka));
        }

        public płytoteka LoadData()
        {
            płytoteka płytoteka = null;
            if (XmlFile.Exists)
            {
                using (TextReader textReader = new StreamReader(XmlFile.FullName))
                {
                    płytoteka = (płytoteka)Serializer.Deserialize(textReader);
                    textReader.Close();
                }
            }
            else
            {
                throw new IOException();
            }

            return płytoteka;
        }

        public void SaveData(płytoteka płytoteka)
        {
            if (XmlFile.Exists) XmlFile.Delete();

            Stream stream = new FileStream(XmlFile.FullName, FileMode.Create);
            Serializer.Serialize(stream, płytoteka);
            stream.Close();
        }

        public void SaveCopy(płytoteka płytoteka)
        {
            FileInfo tmp = new FileInfo("XmlCopy.xml");

            if (tmp.Exists) tmp.Delete();

            Stream stream = new FileStream(tmp.FullName, FileMode.Create);
            Serializer.Serialize(stream, płytoteka);
            stream.Close();
        }

        //    public bool ValidateXmlSchema(płytoteka płytoteka)
        //    {
        //        SaveCopy(płytoteka);
        //        XmlDocument x = new XmlDocument();
        //        x.LoadXml(XmlFile.FullName);

        //        XmlReaderSettings settings = new XmlReaderSettings();
        //        settings.CloseInput = true;
        //        settings.ValidationEventHandler += Handler;

        //        settings.ValidationType = ValidationType.Schema;
        //        settings.Schemas.Add(null, ExtendedTreeViewSchema);
        //        settings.ValidationFlags =
        //             XmlSchemaValidationFlags.ReportValidationWarnings |
        //        XmlSchemaValidationFlags.ProcessIdentityConstraints |
        //        XmlSchemaValidationFlags.ProcessInlineSchema |
        //        XmlSchemaValidationFlags.ProcessSchemaLocation;

        //        StringReader r = new StringReader(XmlSource);

        //        using (XmlReader validatingReader = XmlReader.Create(r, settings))
        //        {
        //            while (validatingReader.Read()) { /* just loop through document */ }
        //        }
        //    }

        //    private static void Handler(object sender, ValidationEventArgs e)
        //    {

        //        if (e.Severity == XmlSeverityType.Error || e.Severity ==
        //XmlSeverityType.Warning)
        //            System.Diagnostics.Trace.WriteLine(
        //              String.Format("Line: {0}, Position: {1} \"{2}\"",
        //                  e.Exception.LineNumber, e.Exception.LinePosition,
        //  e.Exception.Message));

        //    }

        public bool ValidateXmlSchema(płytoteka płytoteka)
        {
            try
            {
                SaveCopy(płytoteka);

                XmlDocument xmld = new XmlDocument();
                string xmlText = File.ReadAllText("XmlCopy.xml");
                xmld.LoadXml(xmlText);
                xmld.Schemas.Add("http://tempuri.org/HeaderNamespace", SchemaFile[0].FullName);
                xmld.Schemas.Add("http://tempuri.org/NumericalTypesNamespace", SchemaFile[1].FullName);
                xmld.Schemas.Add("http://tempuri.org/OurNamespace", SchemaFile[2].FullName);
                xmld.Validate(ValidationCallBack);
                return true;
            }
            catch
            {
                return false;
            }
        }

        private void ValidationCallBack(object sender, ValidationEventArgs e)
        {
            throw new Exception();
        }

    }
}
