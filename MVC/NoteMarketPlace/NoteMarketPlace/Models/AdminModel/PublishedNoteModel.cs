﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NoteMarketPlace.Models.AdminModel
{
    public class PublishedNoteModel
    {

        public int NoteId { get; set; }

        public string Title { get; set; }

        public string Category { get; set; }

        public decimal Price { get; set; }

        public int SellerId { get; set; }

        public string Seller { get; set; }

        public string ApprovedBy { get; set; }

        public DateTime PublishDate { get; set; }

        public int? TotalDownloads { get; set; }

        public int Userid { get; set; }

        public string Filename { get; set; }

    }
}