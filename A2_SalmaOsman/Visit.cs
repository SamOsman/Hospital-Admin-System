using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace A2_SalmaOsman
{
    public class Visit
    {

        protected static string test = "This is a test";
        /*
        first name
        last name
        patient id
        age
        Admission date
        Release date
        doctor
        */
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public int PatientID { get; set; }
        public int Age { get; set; }
        public string AdmissionDate { get; set; }
        public string ReleaseDate { get; set; }
        public string DoctorAssigned { get; set; }






    }
}