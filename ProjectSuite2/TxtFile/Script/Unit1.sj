function Main()
{
  try
  {
    // Enter your code here. 
  }
  catch(exception)
  {
    Log.Error("Exception", exception.description);
  }
}

function CreateSave()
{
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.Edit.Keys("This is a new text file.");
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save As...");
  Aliases.notepad.dlgSaveAs.SaveFile("\\\\VBOXSVR\\Bionic-QA-10-ID\\ProjectSuite2\\TxtFile\\NewFile.txt", "Text Documents (*.txt)");
  Aliases.notepad.wndNotepad.Close();
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("\\\\VBOXSVR\\Bionic-QA-10-ID\\ProjectSuite2\\TxtFile\\NewFile.txt", "Text Documents (*.txt)");
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, "This is a new text file.", false);
  Aliases.notepad.wndNotepad.Close();
}

function EditSave1()
{
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("\\\\VBOXSVR\\Bionic-QA-10-ID\\ProjectSuite2\\TxtFile\\NewFile.txt", "Text Documents (*.txt)");
  Aliases.notepad.wndNotepad.MainMenu.Click("Edit|Select All");
  Aliases.notepad.wndNotepad.MainMenu.Click("Edit|Copy");
  Aliases.notepad.wndNotepad.Edit.Click(208, 13);
  Aliases.notepad.wndNotepad.Edit.Keys("[Enter]This is an edit.");
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save");
  Aliases.notepad.wndNotepad.Close();
  Delay(100);
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("\\\\VBOXSVR\\Bionic-QA-10-ID\\ProjectSuite2\\TxtFile\\NewFile.txt", "Text Documents (*.txt)");
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, "This is a new text file.\r\nThis is an edit.", false);
  Aliases.notepad.wndNotepad.Close();
  Delay(100);
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("\\\\VBOXSVR\\Bionic-QA-10-ID\\ProjectSuite2\\TxtFile\\NewFile.txt", "Text Documents (*.txt)");
  Aliases.notepad.wndNotepad.MainMenu.Click("Edit|Select All");
  Aliases.notepad.wndNotepad.Edit.Keys("[BS]");
  Aliases.notepad.wndNotepad.MainMenu.Click("Edit|Paste");
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save");
  Aliases.notepad.wndNotepad.Close();
}
