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

using NPlot.Gtk;
using NPlot;
using System.Drawing;
using System.Drawing.Imaging;
using Mono.Unix;

public class GraphDjQ : StatDjQ
{
	protected string operation;
	private Random myRand = new Random();
	private int countSeriesGraphColors = 0;

	//for simplesession
	GraphSerie serieIndex;
	GraphSerie serieHeight;
	GraphSerie serieTc;
	GraphSerie serieTv;
	GraphSerie serieFall;

	public GraphDjQ (StatTypeStruct myStatTypeStruct)
	{
		completeConstruction (myStatTypeStruct, treeview);
		
		this.dataColumns = 5; //for Simplesession (index, height, tv, tc, fall)
		
		if (statsJumpsType == 2) {
			this.operation = "MAX";
		} else {
			this.operation = "AVG";
		}

		CurrentGraphData.WindowTitle = Catalog.GetString("ChronoJump graph");
		//title is shown on the graph except it's a report, then title will be on the html
		if(myStatTypeStruct.ToReport) {
			CurrentGraphData.GraphTitle = "";
		} else {
			CurrentGraphData.GraphTitle = this.ToString();
		}
		
		if(sessions.Count == 1) {
			//four series, the four columns
			serieIndex = new GraphSerie();
			serieHeight = new GraphSerie();
			serieTc = new GraphSerie();
			serieTv = new GraphSerie();
			serieFall = new GraphSerie();
				
			serieIndex.Title = Catalog.GetString("Index *100");
			serieHeight.Title = Catalog.GetString("Height");
			serieTc.Title = Catalog.GetString("TC");
			serieTv.Title = Catalog.GetString("TF");
			serieFall.Title = Catalog.GetString("Fall");
			
			serieIndex.IsLeftAxis = false;
			serieHeight.IsLeftAxis = false;
			serieTc.IsLeftAxis = true;
			serieTv.IsLeftAxis = true;
			serieFall.IsLeftAxis = false;

			serieIndex.SerieMarker = new Marker (Marker.MarkerType.FilledCircle, 
					6, new Pen (Color.FromName("Red"), 2.0F));
			serieHeight.SerieMarker = new Marker (Marker.MarkerType.Cross1, 
					6, new Pen (Color.FromName("Grey"), 2.0F));
			//serieTc.SerieMarker = new Marker (Marker.MarkerType.TriangleDown, 
			serieTc.SerieMarker = new Marker (Marker.MarkerType.Cross1, 
					6, new Pen (Color.FromName("Green"), 2.0F));
			//serieTv.SerieMarker = new Marker (Marker.MarkerType.TriangleUp, 
			serieTv.SerieMarker = new Marker (Marker.MarkerType.Cross1, 
					6, new Pen (Color.FromName("Blue"), 2.0F));
			serieFall.SerieMarker = new Marker (Marker.MarkerType.Cross2, 
					6, new Pen (Color.FromName("Chocolate"), 2.0F));
		
			//for the line between markers
			serieIndex.SerieColor = Color.FromName("Red");
			serieHeight.SerieColor = Color.FromName("Grey");
			serieTc.SerieColor = Color.FromName("Green");
			serieTv.SerieColor = Color.FromName("Blue");
			serieFall.SerieColor = Color.FromName("Chocolate");
		
			CurrentGraphData.LabelLeft = Catalog.GetString("seconds");
			CurrentGraphData.LabelRight = "%, cm";
		} else {
			for(int i=0; i < sessions.Count ; i++) {
				string [] stringFullResults = sessions[i].ToString().Split(new char[] {':'});
				CurrentGraphData.XAxisNames.Add(stringFullResults[1].ToString());
			}
			CurrentGraphData.LabelLeft = "%";
			CurrentGraphData.LabelRight = "";
		}
	}

	protected override void printData (string [] statValues) 
	{
		if(sessions.Count == 1) {
			int i = 0;
			//we need to save this transposed
			foreach (string myValue in statValues) 
			{
				if(i == 0) {
					//don't plot AVG and SD rows
					if( myValue == Catalog.GetString("AVG") || myValue == Catalog.GetString("SD") ) {
						//good moment for adding created series to GraphSeries ArrayList
						//check don't do it two times
						if(GraphSeries.Count == 0) {
							GraphSeries.Add(serieIndex);
							GraphSeries.Add(serieHeight);
							GraphSeries.Add(serieTc);
							GraphSeries.Add(serieTv);
							GraphSeries.Add(serieFall);
						}
						
						return;
					}
					CurrentGraphData.XAxisNames.Add(myValue);
				} else if(i == 1) {
					serieIndex.SerieData.Add( (
							Convert.ToDouble(myValue) *100).ToString() );
				} else if(i == 2) {
					serieHeight.SerieData.Add(myValue);
				} else if(i == 3) {
					serieTv.SerieData.Add(myValue);
				} else if(i == 4) {
					serieTc.SerieData.Add(myValue);
				} else if(i == 5) {
					serieFall.SerieData.Add(myValue);
				}
				i++;
			}
		} else {
			GraphSerie mySerie = new GraphSerie();
			mySerie.IsLeftAxis = true;
		
			//color code
			Color myColor = new Color();
			if(countSeriesGraphColors > Constants.Colors.Length) {
				int myR = myRand.Next(255 - 40); //not 255 for not being so light colors
				int myG = myRand.Next(255 - 40);
				int myB = myRand.Next(255 - 40);
				myColor = Color.FromArgb(myR, myG, myB);
			} else {
				myColor = Color.FromName(Constants.Colors[countSeriesGraphColors]);
				countSeriesGraphColors ++;
			}
			
			mySerie.SerieMarker = new Marker (Marker.MarkerType.Cross1, 
					6, new Pen (myColor, 2.0F));
			
			mySerie.SerieColor = myColor;
			
			
			int i=0;
			foreach (string myValue in statValues) {
				if( myValue == Catalog.GetString("AVG") || myValue == Catalog.GetString("SD") ) {
					return;
				}
				if(i == 0) {
					mySerie.Title = myValue;
				} else {
					mySerie.SerieData.Add(myValue);
				}
				i++;
			}
			GraphSeries.Add(mySerie);
		}
	}
}
