//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace first_site_web.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Creneau
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Creneau()
        {
            this.Personne1 = new HashSet<Personne>();
        }
    
        public int Id_Creneau { get; set; }
        public int Nombre_Places_Dispo { get; set; }
        public int Nombre_Places_Max { get; set; }
        public int Section_Id_Section { get; set; }
        public int Lieu_Id_Lieu { get; set; }
        public int Encadrant { get; set; }
        public string Jour { get; set; }
        public Nullable<System.TimeSpan> Heure { get; set; }
    
        public virtual Lieu Lieu { get; set; }
        public virtual Personne Personne { get; set; }
        public virtual Section Section { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Personne> Personne1 { get; set; }
    }
}
