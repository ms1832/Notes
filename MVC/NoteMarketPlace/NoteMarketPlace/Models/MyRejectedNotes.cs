﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NoteMarketPlace.Models
{
    public class MyRejectedNotes
    {

        public int Id { get; set; }

        public string Title { get; set; }

        public string Category { get; set; }

        public string Remark { get; set; }

        public string DownloadNote { get; set; }

    }
}