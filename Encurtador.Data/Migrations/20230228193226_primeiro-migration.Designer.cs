﻿// <auto-generated />
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Encurtador.Data.Migrations
{
    [DbContext(typeof(EncurtadorContext))]
    [Migration("20230228193226_primeiro-migration")]
    partial class primeiromigration
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder.HasAnnotation("ProductVersion", "7.0.3");

            modelBuilder.Entity("Encurtador.Domain.Entities.Encurtado", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<DateTime>("DataCriacao")
                        .HasColumnType("TEXT");

                    b.Property<DateTime>("DataExpiracao")
                        .HasColumnType("TEXT");

                    b.Property<string>("UrlEncurtada")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.Property<string>("UrlOriginal")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Encurtado");
                });
#pragma warning restore 612, 618
        }
    }
}
