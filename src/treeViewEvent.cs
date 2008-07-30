/*
 * This file is part of ChronoJump
 *
 * ChronoJump is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or   
 *    (at your option) any later version.
 *    
 * ChronoJump is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
 *    GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * Xavier de Blas: 
 * http://www.xdeblas.com, http://www.deporteyciencia.com (parleblas)
 */

using System;
using System.Data;
using Gtk;
using System.Collections; //ArrayList
using Mono.Unix;


public class TreeViewEvent
{
	protected TreeStore store;
	protected Gtk.TreeView treeview;
	protected int pDN; //prefsDigitsNumber;
	
	protected bool treeviewHasTwoLevels;
	protected int dataLineNamePosition; //position of name in the data to be printed
	protected int dataLineTypePosition; //position of type in the data to be printed
	protected string allEventsName; //Constants.AllJumpsName or Constants.AllRunsName orConstants.AllPulsesName
	protected int eventIDColumn; //column where the uniqueID of event will be (and will be hidded)
	protected string descriptionName = Catalog.GetString("Description");
	
	protected string [] columnsString;

	public enum ExpandStates {
		MINIMIZED, OPTIMAL, MAXIMIZED
	}
	
	public ExpandStates expandState;

	public TreeViewEvent ()
	{
	}
	
	public TreeViewEvent (Gtk.TreeView treeview, int newPrefsDigitsNumber, ExpandStates expandState)
	{
		this.treeview = treeview;
		this.pDN = newPrefsDigitsNumber;
		this.expandState = expandState;

		//orientative values, used for Run class
		treeviewHasTwoLevels = false;
		dataLineNamePosition = 0;
		dataLineTypePosition = 4;
		allEventsName = "";
		eventIDColumn = 4;

		columnsString = new string[0];
	
		store = getStore(columnsString.Length +1); //+1 because, eventID is not show in last col
		treeview.Model = store;
		prepareHeaders(columnsString);
	}
	
	protected TreeStore getStore (int columns)
	{
		//prepares the TreeStore for required columns
		Type [] types = new Type [columns];
		for (int i=0; i < columns; i++) {
			types[i] = typeof (string);
		}
		TreeStore myStore = new TreeStore(types);
		return myStore;
	}
	
	protected virtual void prepareHeaders(string [] columnsString) 
	{
		treeview.HeadersVisible=true;
		int i=0;
		foreach(string myCol in columnsString) {
			treeview.AppendColumn (myCol, new CellRendererText(), "text", i++);
		}
	}
	
	public virtual void RemoveColumns() {
		Gtk.TreeViewColumn [] myColumns = treeview.Columns;
		foreach (Gtk.TreeViewColumn column in myColumns) {
			treeview.RemoveColumn (column);
		}
	}

	protected virtual System.Object getObjectFromString(string [] myStringOfData)
	{
		System.Object myObject = new System.Object();
		return myObject;
	}
	
	protected virtual int getNumOfSubEvents(System.Object myObject)
	{
		return 0; //not used in treeViewEventClass
	} 
			

	//1st level
	protected virtual string [] getLineToStore(System.Object myObject)
	{
		string [] myData = new String [1]; //columnsString + 1
		//int count = 0;
		//myData[count++] = myObject.Name + ...;
		//...

		return myData;
	}
	
	//for 2nd level
	protected virtual string [] getSubLineToStore(System.Object myObject, int lineCount)
	{
		string [] myData = new String [1]; //columnsString + 1
		//int count = 0;
		//myData[count++] = lineCount.ToString() ...;
		//...

		return myData;
	}

	protected virtual int getColsNum() {
		return columnsString.Length +1;
	}
	
	protected void addStatisticInfo(TreeIter iterDeep, System.Object myObject) {
		store.AppendValues(iterDeep, printTotal(myObject, getColsNum()));
		store.AppendValues(iterDeep, printAVG(myObject, getColsNum()));
		store.AppendValues(iterDeep, printSD(myObject, getColsNum()));
	}
	
	protected virtual string [] printTotal(System.Object myObject, int cols) {
		string [] nothing = new string[0];
		return nothing;
	}
	
	protected virtual string [] printAVG(System.Object myObject, int cols) {
		string [] nothing = new string[0];
		return nothing;
	}

	protected virtual string [] printSD(System.Object myObject, int cols) {
		string [] nothing = new string[0];
		return nothing;
	}

	public virtual void Fill(string [] myEvents, string filter)
	{
		TreeIter iter = new TreeIter();
		TreeIter iterDeep = new TreeIter(); //only used by two levels treeviews
		string tempPerson = ":"; //one value that's not possible

		foreach (string singleEvent in myEvents) {
			string [] myStringFull = singleEvent.Split(new char[] {':'});

			//show always the names of runners ...
			if(tempPerson != myStringFull[dataLineNamePosition])
			{
				iter = store.AppendValues (myStringFull[dataLineNamePosition]);
				tempPerson = myStringFull[dataLineNamePosition];
			}

			//... but if we selected one type of run and this it's not the type, don't show
			if(filter == allEventsName || filter == myStringFull[dataLineTypePosition]) 
			{
				//get the object from the string
				System.Object myEvent = getObjectFromString(myStringFull);
				
				//getLineToStoreFromString is overriden in two level treeviews
				iterDeep = store.AppendValues (iter, getLineToStore(myEvent));
				if(treeviewHasTwoLevels) {
					addStatisticInfo(iterDeep, myEvent);
					for(int i = 0; i < getNumOfSubEvents(myEvent); i ++) {
						store.AppendValues(iterDeep, getSubLineToStore(myEvent, i));
					}
				}
			}
		}
	}

	public void Add (string personName, System.Object newEvent)
	{
		
		TreeIter iter = new TreeIter();
		TreeIter iterDeep = new TreeIter(); //only used by two levels treeviews
		bool modelNotEmpty = treeview.Model.GetIterFirst ( out iter ) ;
		string iterPersonString;
		bool found = false;
	
		if(modelNotEmpty) {
			do {
				iterPersonString = ( treeview.Model.GetValue (iter, 0) ).ToString();
				if(iterPersonString == personName) {
					found = true;

					//expand the person
					treeview.ExpandToPath( treeview.Model.GetPath(iter) );

					//getLineToStore is overriden in two level treeviews
					iterDeep = store.AppendValues (iter, getLineToStore(newEvent));

					//select the test			
					treeview.Selection.SelectIter(iterDeep);
					
					TreePath path = store.GetPath (iterDeep);
					treeview.ScrollToCell (path, null, true, 0, 0);
				
					if(treeviewHasTwoLevels) {
						addStatisticInfo(iterDeep, newEvent);
						for(int i=0; i < getNumOfSubEvents(newEvent); i++) {
							store.AppendValues(iterDeep, getSubLineToStore(newEvent, i));
						}
					}
				}
			} while (treeview.Model.IterNext (ref iter));
		}

		//if the person has not done this kind of event in this session, it's name doesn't appear in the treeview
		//create the name, and write the event
		if(! found) {
			iter = store.AppendValues (personName);
			
			iterDeep = store.AppendValues (iter, getLineToStore(newEvent));
			
			//scroll treeview if needed
			TreePath path = store.GetPath (iterDeep);
			treeview.ScrollToCell (path, null, true, 0, 0);
		
			if(treeviewHasTwoLevels) {
				addStatisticInfo(iterDeep, newEvent);
				for(int i=0; i < getNumOfSubEvents(newEvent); i++) {
					store.AppendValues(iterDeep, getSubLineToStore(newEvent, i));
				}
			}
			
			//expand the person
			treeview.ExpandToPath( treeview.Model.GetPath(iter) );
			
			//select the test			
			treeview.Selection.SelectIter(iterDeep);
		}
	}
		
	public void DelEvent (int eventID)
	{
		TreeIter iter = new TreeIter();
		treeview.Model.GetIterFirst ( out iter ) ;
		
		do {
			if( treeview.Model.IterHasChild(iter) ) {
				treeview.Model.IterChildren (out iter, iter);
				do {
					int iterEventID =  Convert.ToInt32 ( treeview.Model.GetValue (iter, eventIDColumn) );
					if(iterEventID == eventID) {
						//get parent (to delete if empty)
						TreeIter iterParent;
					       	bool parentOk = treeview.Model.IterParent(out iterParent, iter);

						//delete iter (test)
						store.Remove(ref iter);

						//delete parent (person on eventTreeview) if has no more child
						if(parentOk)
							deleteParentIfEmpty(iterParent);

						return;
					}
				} while (treeview.Model.IterNext (ref iter));
				treeview.Model.IterParent (out iter, iter);
			}
		} while (treeview.Model.IterNext (ref iter));
	}

	private void deleteParentIfEmpty(TreeIter iter) {
		if( ! treeview.Model.IterHasChild(iter) ) 
			store.Remove(ref iter);
	}

	public void Unselect () {
		treeview.Selection.UnselectAll();
	}

	public virtual void ExpandOptimal()
	{
		TreeIter iter = new TreeIter();
		bool tvExists = treeview.Model.GetIterFirst ( out iter ) ; //returns false if empty
	
		if (tvExists) {
			do {
				treeview.ExpandToPath( treeview.Model.GetPath(iter) );
			} while (treeview.Model.IterNext (ref iter));
		}
	}
	
	
	public int EventSelectedID {
		get {
			TreeIter iter = new TreeIter();
			TreeModel myModel = treeview.Model;
			if (treeview.Selection.GetSelected (out myModel, out iter)) {
				return Convert.ToInt32 ( treeview.Model.GetValue(iter, eventIDColumn) );
			} else {
				return 0;
			}
		}
	}
	
	public ExpandStates ExpandState {
		get { return expandState; }
		set { expandState = value; }
	}
}
