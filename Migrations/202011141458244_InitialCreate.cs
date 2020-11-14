namespace first_site_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Creneau",
                c => new
                    {
                        Id_Creneau = c.Int(nullable: false, identity: true),
                        Nombre_Places_Dispo = c.Int(nullable: false),
                        Nombre_Places_Max = c.Int(nullable: false),
                        Section_Id_Section = c.Int(nullable: false),
                        Lieu_Id_Lieu = c.Int(nullable: false),
                        Encadrant = c.Int(nullable: false),
                        Jour = c.String(),
                        Heure = c.Time(precision: 7),
                        Lieu_Id_Lieu1 = c.Int(),
                        Personne_Id_Personne = c.Int(),
                        Personne_Id_Personne1 = c.Int(),
                        Section_Id_Section1 = c.Int(),
                        Personne_Id_Personne2 = c.Int(),
                    })
                .PrimaryKey(t => t.Id_Creneau)
                .ForeignKey("dbo.Lieu", t => t.Lieu_Id_Lieu1)
                .ForeignKey("dbo.Personne", t => t.Personne_Id_Personne)
                .ForeignKey("dbo.Personne", t => t.Personne_Id_Personne1)
                .ForeignKey("dbo.Section", t => t.Section_Id_Section1)
                .ForeignKey("dbo.Personne", t => t.Personne_Id_Personne2)
                .Index(t => t.Lieu_Id_Lieu1)
                .Index(t => t.Personne_Id_Personne)
                .Index(t => t.Personne_Id_Personne1)
                .Index(t => t.Section_Id_Section1)
                .Index(t => t.Personne_Id_Personne2);
            
            CreateTable(
                "dbo.Lieu",
                c => new
                    {
                        Id_Lieu = c.Int(nullable: false, identity: true),
                        Adresse = c.String(),
                        Nom = c.String(),
                    })
                .PrimaryKey(t => t.Id_Lieu);
            
            CreateTable(
                "dbo.Personne",
                c => new
                    {
                        Id_Personne = c.Int(nullable: false, identity: true),
                        Nom = c.String(),
                        Prenom = c.String(),
                        Date_Naissance = c.DateTime(nullable: false),
                        E_mail = c.String(),
                        Num_Telephone = c.String(),
                        Sexe = c.String(),
                        Mot_de_Passe = c.String(),
                        Creneau_Id_Creneau = c.Int(),
                    })
                .PrimaryKey(t => t.Id_Personne)
                .ForeignKey("dbo.Creneau", t => t.Creneau_Id_Creneau)
                .Index(t => t.Creneau_Id_Creneau);
            
            CreateTable(
                "dbo.Dossier",
                c => new
                    {
                        Id_Dossier = c.Int(nullable: false, identity: true),
                        Paiement = c.Byte(nullable: false),
                        Personne_Id_Personne = c.Int(nullable: false),
                        Section_Id_Section = c.Int(nullable: false),
                        Personne_Id_Personne1 = c.Int(),
                        Section_Id_Section1 = c.Int(),
                    })
                .PrimaryKey(t => t.Id_Dossier)
                .ForeignKey("dbo.Personne", t => t.Personne_Id_Personne1)
                .ForeignKey("dbo.Section", t => t.Section_Id_Section1)
                .Index(t => t.Personne_Id_Personne1)
                .Index(t => t.Section_Id_Section1);
            
            CreateTable(
                "dbo.Document",
                c => new
                    {
                        Id_Doc = c.Int(nullable: false, identity: true),
                        Type_Document = c.String(),
                        Dossier_Id_Dossier = c.Int(nullable: false),
                        Fichier = c.Binary(),
                        Est_Valide = c.Byte(),
                        Dossier_Id_Dossier1 = c.Int(),
                    })
                .PrimaryKey(t => t.Id_Doc)
                .ForeignKey("dbo.Dossier", t => t.Dossier_Id_Dossier1)
                .Index(t => t.Dossier_Id_Dossier1);
            
            CreateTable(
                "dbo.Section",
                c => new
                    {
                        Id_Section = c.Int(nullable: false, identity: true),
                        Nom = c.String(),
                        Prix = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Discipline_Id_Discipline = c.Int(nullable: false),
                        Discipline_Id_Discipline1 = c.Int(),
                    })
                .PrimaryKey(t => t.Id_Section)
                .ForeignKey("dbo.Discipline", t => t.Discipline_Id_Discipline1)
                .Index(t => t.Discipline_Id_Discipline1);
            
            CreateTable(
                "dbo.Discipline",
                c => new
                    {
                        Id_Discipline = c.Int(nullable: false, identity: true),
                        Nom_Discipline = c.String(),
                    })
                .PrimaryKey(t => t.Id_Discipline);
            
            CreateTable(
                "dbo.Role",
                c => new
                    {
                        Id_Role = c.Int(nullable: false, identity: true),
                        Nom_Role = c.String(),
                    })
                .PrimaryKey(t => t.Id_Role);
            
            CreateTable(
                "dbo.RolePersonne",
                c => new
                    {
                        Role_Id_Role = c.Int(nullable: false),
                        Personne_Id_Personne = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.Role_Id_Role, t.Personne_Id_Personne })
                .ForeignKey("dbo.Role", t => t.Role_Id_Role, cascadeDelete: true)
                .ForeignKey("dbo.Personne", t => t.Personne_Id_Personne, cascadeDelete: true)
                .Index(t => t.Role_Id_Role)
                .Index(t => t.Personne_Id_Personne);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Personne", "Creneau_Id_Creneau", "dbo.Creneau");
            DropForeignKey("dbo.Creneau", "Personne_Id_Personne2", "dbo.Personne");
            DropForeignKey("dbo.RolePersonne", "Personne_Id_Personne", "dbo.Personne");
            DropForeignKey("dbo.RolePersonne", "Role_Id_Role", "dbo.Role");
            DropForeignKey("dbo.Dossier", "Section_Id_Section1", "dbo.Section");
            DropForeignKey("dbo.Section", "Discipline_Id_Discipline1", "dbo.Discipline");
            DropForeignKey("dbo.Creneau", "Section_Id_Section1", "dbo.Section");
            DropForeignKey("dbo.Dossier", "Personne_Id_Personne1", "dbo.Personne");
            DropForeignKey("dbo.Document", "Dossier_Id_Dossier1", "dbo.Dossier");
            DropForeignKey("dbo.Creneau", "Personne_Id_Personne1", "dbo.Personne");
            DropForeignKey("dbo.Creneau", "Personne_Id_Personne", "dbo.Personne");
            DropForeignKey("dbo.Creneau", "Lieu_Id_Lieu1", "dbo.Lieu");
            DropIndex("dbo.RolePersonne", new[] { "Personne_Id_Personne" });
            DropIndex("dbo.RolePersonne", new[] { "Role_Id_Role" });
            DropIndex("dbo.Section", new[] { "Discipline_Id_Discipline1" });
            DropIndex("dbo.Document", new[] { "Dossier_Id_Dossier1" });
            DropIndex("dbo.Dossier", new[] { "Section_Id_Section1" });
            DropIndex("dbo.Dossier", new[] { "Personne_Id_Personne1" });
            DropIndex("dbo.Personne", new[] { "Creneau_Id_Creneau" });
            DropIndex("dbo.Creneau", new[] { "Personne_Id_Personne2" });
            DropIndex("dbo.Creneau", new[] { "Section_Id_Section1" });
            DropIndex("dbo.Creneau", new[] { "Personne_Id_Personne1" });
            DropIndex("dbo.Creneau", new[] { "Personne_Id_Personne" });
            DropIndex("dbo.Creneau", new[] { "Lieu_Id_Lieu1" });
            DropTable("dbo.RolePersonne");
            DropTable("dbo.Role");
            DropTable("dbo.Discipline");
            DropTable("dbo.Section");
            DropTable("dbo.Document");
            DropTable("dbo.Dossier");
            DropTable("dbo.Personne");
            DropTable("dbo.Lieu");
            DropTable("dbo.Creneau");
        }
    }
}
