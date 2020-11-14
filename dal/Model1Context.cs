//------------------test ajouté à la main
using first_site_web.Models;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace first_site_web.dal
{
    public class Model1Context : DbContext
    {
        public Model1Context() : base("SportAsso_BDDEntities")
        {
            Database.SetInitializer<Model1Context>(null);
        }
        public DbSet<Creneau> Creneaux { get; set; }
        public DbSet<Discipline> Disciplines { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}

//--------------