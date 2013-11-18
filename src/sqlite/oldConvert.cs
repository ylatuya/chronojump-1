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
 * Copyright (C) 2004-2013   Xavier de Blas <xaviblas@gmail.com> 
 */

using System;
using System.Data;
using System.IO;
using System.Collections; //ArrayList
using Mono.Data.Sqlite;

/* methods for convert from old tables to new tables */

class SqliteOldConvert : Sqlite
{
	//pass uniqueID value and then will return one record. do like this:
	//EncoderSQL eSQL = (EncoderSQL) SqliteEncoder.Select(false, myUniqueID, 0, 0, "")[0];
	//or
	//pass uniqueID==-1 and personID, sessionID, signalOrCurve values, and will return some records
	//personID can be -1 to get all on that session
	//sessionID can be -1 to get all sessions
	//signalOrCurve can be "all"
	public static ArrayList EncoderSelect098 (bool dbconOpened, 
			int uniqueID, int personID, int sessionID, string signalOrCurve, bool onlyActive)
	{
		if(! dbconOpened)
			dbcon.Open();

		string personIDStr = "";
		if(personID != -1)
			personIDStr = " personID = " + personID + " AND ";

		string sessionIDStr = "";
		if(sessionID != -1)
			sessionIDStr = " sessionID = " + sessionID + " AND ";

		string selectStr = "";
		if(uniqueID != -1)
			selectStr = Constants.EncoderTable + ".uniqueID = " + uniqueID;
		else {
			if(signalOrCurve == "all")
				selectStr = personIDStr + sessionIDStr;
			else
				selectStr = personIDStr + sessionIDStr + " signalOrCurve = '" + signalOrCurve + "'";
		}

		string andString = "";
		if(selectStr != "")
			andString = " AND ";

		string onlyActiveString = "";
		if(onlyActive)
			onlyActiveString = " AND " + Constants.EncoderTable + ".future1 = 'active' ";

		dbcmd.CommandText = "SELECT " + 
			Constants.EncoderTable + ".*, " + Constants.EncoderExerciseTable + ".name FROM " + 
			Constants.EncoderTable  + ", " + Constants.EncoderExerciseTable  + 
			" WHERE " + selectStr +
			andString + Constants.EncoderTable + ".exerciseID = " + 
				Constants.EncoderExerciseTable + ".uniqueID " +
				onlyActiveString +
			" ORDER BY substr(filename,-23,19)"; //this contains the date of capture signal

		Log.WriteLine(dbcmd.CommandText.ToString());
		
		SqliteDataReader reader;
		reader = dbcmd.ExecuteReader();

		ArrayList array = new ArrayList(1);

		EncoderSQL098 es = new EncoderSQL098();
		while(reader.Read()) {
			es = new EncoderSQL098 (
					reader[0].ToString(),			//uniqueID
					Convert.ToInt32(reader[1].ToString()),	//personID	
					Convert.ToInt32(reader[2].ToString()),	//sessionID
					Convert.ToInt32(reader[3].ToString()),	//exerciseID
					reader[4].ToString(),			//eccon
					reader[5].ToString(),			//laterality
					reader[6].ToString(),			//extraWeight
					reader[7].ToString(),			//signalOrCurve
					reader[8].ToString(),			//filename
					reader[9].ToString(),			//url
					Convert.ToInt32(reader[10].ToString()),	//time
					Convert.ToInt32(reader[11].ToString()),	//minHeight
					Convert.ToDouble(Util.ChangeDecimalSeparator(reader[12].ToString())), //smooth UNUSED
					reader[13].ToString(),			//description
					reader[14].ToString(),			//future1
					reader[15].ToString(),			//future2
					reader[16].ToString(),			//future3
					reader[17].ToString()			//EncoderExercise.name
					);
			array.Add (es);
		}
		reader.Close();
		if(! dbconOpened)
			dbcon.Close();

		return array;
	}
}
