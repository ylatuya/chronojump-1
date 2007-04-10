#!/usr/bin/perl -w

#
# This file is part of ChronoJump
#
# Chronojump is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or   
#    (at your option) any later version.
#    
# Chronojump is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
#    GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
# Xavier de Blas: 
# http://www.xdeblas.com, http://www.deporteyciencia.com (parleblas)
#

use strict;

#CONSTANTS
my $currentVersion = "0.52";
my $currentVersionDay = "31";
my $currentVersionMonth = 3; #if it's from 1 to 9, put only one digit
my $currentVersionYear = "2007";
my $linuxMailDownloadLink = "http://mail.gnome.org/archives/chronojump-list/2007-March/msg00004.html";
my $linuxMailDownloadName = "Chronojump 0.52 for Linux (New!) Installation";
my $windowsMailDownloadLink = "http://mail.gnome.org/archives/chronojump-list/2007-March/msg00003.html";
my $windowsMailDownloadName = "Chronojump 0.52 for Windows (New!) Installation";
my $changesMailDownloadLink = "http://mail.gnome.org/archives/chronojump-list/2007-March/msg00002.html";



my $siteURL = "http://www.gnome.org/projects/chronojump";
#my $siteURL = ".";
my $CVSURL = "http://cvs.gnome.org/viewcvs/chronojump";

my %languages=();

my $languagesFile = "languages.txt";
my $authorsFile = "authors.txt";
my $colaborationsFile = "colaborations.txt";
my $contributorsFile = "contributors.txt",


my $authors = &getPeople($authorsFile);
my $colaborations = &getPeople($colaborationsFile);
my $contributors = &getPeople($contributorsFile);


#read languagesFile, contains languageName:suffix
open (LANGUAGESFILE, "data/$languagesFile");
while (<LANGUAGESFILE>) {
	chomp $_;
	my ($langName, $langSuffix)=split(/:/,$_);
	$languages{$langSuffix}=$langName;
}
close LANGUAGESFILE;


#foreach language
for (sort keys %languages) 
{
	my $langSuffix = $_;
	my $langName = $languages{$_};

	#read the title 
	my $headersWithTitle = "";
	my $mainTable = "";
	open IN,"data/langs/$langSuffix/Title";
	foreach(<IN>) {
		chomp $_;
		$headersWithTitle = &getHeadersWithTitle($_);
		$mainTable = &getMainTable();
	}
	close IN;

	#read all the data files for current language
	open DATAFILES,"ls data/langs/$langSuffix/Pages/ | ";
	foreach (<DATAFILES>) {

		#strip out CVS dirs
		if($_ =~ m/CVS/) {
			next;
		}
			
		my $currentPage = $_;
		chomp $currentPage;
		print "--- Processing FILE data/langs/$langSuffix/Pages/$currentPage\n";
		my $returnPage = "";	#page for viewing
		my $returnPrintPage = "";	#page for printing


		#read the links horizontal bar
		my $horizontalBarHTML = "";
		open IN,"data/langs/$langSuffix/Links";
		foreach(<IN>) {
			my @parts = "";
			#see the filename of each horizontal bar link
			if ($_ =~ m{<li><a href="(.*)\.html"}ig) {
				#delete the "_xx" if exists
				@parts = split(/_/,$1);
				#print "$parts[0]\n";
			}
			if ($parts[0] eq $currentPage) {
				#print the "currentPage" style and don't print the link
				$_ =~ m{html">(.*)<\/a};
				$_ = "<li id=\"currentPage\">$1<\/li>";
			} 
			$horizontalBarHTML .= $_;
		}
		close IN;


		#print Title
		$returnPage = $headersWithTitle;
		$returnPage .= $mainTable;
		$returnPrintPage = $headersWithTitle;

		#print links to other languages
		my $languageLinks = &getLanguageLinks($langSuffix, $langName, $currentPage, %languages);
		$returnPage .= $languageLinks;

		#print horizontal link bar
		$returnPage .= $horizontalBarHTML;

		#print some table stuff
		$returnPage .= "<table border = \"0\" width = \"100%\" cellpadding=\"0\" cellspacing=\"0\">\n
			<tr valign=\"top\"><td align=\"left\">\n
			<div id=\"content\">
			<div id=\"content-body\">";

		
		#read the file
		open INFILE, "data/langs/$langSuffix/Pages/$currentPage";
		while (<INFILE>) {
			$returnPage .= $_;
			$returnPrintPage .= $_;
		}
		close INFILE;

		#put printPage link in correct language...
		$returnPage = &convertTitleAndPrintable($returnPage, $langSuffix, $currentPage, "false");
		#... and hide :::startTitle:::, :::endTitle::: in the printable
		$returnPrintPage = &convertTitleAndPrintable($returnPrintPage, $langSuffix, $currentPage, "true");

		#get complete license for this language
		$returnPage .= &getLicense($langSuffix, $authors, $colaborations, $contributors);
		
		$returnPage .= &getFooter($langSuffix);
		$returnPrintPage .= "</body></html>";

		#convert links to images
		$returnPage  = getSiteLinks($returnPage);
		$returnPrintPage  = getSiteLinks($returnPrintPage);
	
		#write constants
		$returnPage  = getConstants($returnPage, $langSuffix);
		$returnPrintPage  = getConstants($returnPrintPage, $langSuffix);
	
		#filter file (convert á in &aacute; ...)
		#this is for solving a configuration problem in apache of software-libre.org
		$returnPage  = filterHTML($returnPage);
		$returnPrintPage  = filterHTML($returnPrintPage);

		#save files
		my $outputFile = "";
		my $outputPrintFile = "";
		if($langSuffix eq "_en") {
			#don't print "_en" in english 
			$outputFile = "html_created_no_edit/$currentPage" . ".html";
			$outputPrintFile = "html_created_no_edit/print/$currentPage" . ".html";
		} else {
			$outputFile = "html_created_no_edit/$currentPage$langSuffix" . ".html";
			$outputPrintFile = "html_created_no_edit/print/$currentPage$langSuffix" . ".html";
		}
		
		open OUT, ">$outputFile";
		print OUT $returnPage;
		close OUT;
		
		open OUT, ">$outputPrintFile";
		print OUT $returnPrintPage;
		close OUT;
	}
}

sub getHeadersWithTitle {
	my $title=($_);
		
	my $return = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"es   \">

			  <head>
			  	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />
		<title>$title</title>
		<style type=\"text/css\">
			\@import url(style.css)\;
		</style>
		</head>

		<body id=\"page-main\" class=\"with-sidebar\">
		";
	return $return;
}

sub getMainTable {
	my $return = "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">
		<tr><td align=\"left\">
		<div align=\"left\"><img src=\"images/chronojump33.png\" alt=\"logo\" width=\"591\" height=\"177\" border=\"0\">
		</div>
		</td><td valign=\"bottom\" align=\"right\">
		";
	return $return;
}

sub getLanguageLinks {
	my ($langSuffix, $langName, $currentPage, %languages) = @_;

	my $return = "<div id=\"sidebar\">\n";
	$return .= "<ul>\n";

	my $printLink = "true";
	my $link = "";

	#print other languages if available
	for (sort keys %languages) 
	{
		if($langSuffix eq $_) {
			$printLink = "false";
			$return .= "<li id=\"currentLanguage\">";
		}
		else { 
			$printLink = "true";
			$return .= "<li>"; 
		}
			
		#if found this document in other language show link
		if(-e "data/langs/$_/Pages/$currentPage") {
			#if it's english, don't print the "_en"
			if($_ eq "_en") {
				$link = "<a href=\"$currentPage.html\">";
			} else {
				$link = "<a href=\"$currentPage$_.html\">";
			}

			if($printLink eq "true") {
				$return .= "$link$languages{$_}</a>";
			} else {
				$return .= "$languages{$_}";
			}
		} else {
			$return .= "$languages{$_} (pending)";
		}

		$return .= "</li>\n";
	}
	$return .= "</ul><br>\n";
	$return .= "</div></td></tr></table>\n";
	return $return;
}

sub getLanguageLinksOld {
	my ($langSuffix, $langName, $currentPage, %languages) = @_;

	my $return = "<div id=\"sidebar\">\n";

	#print current Language in a h2
	$return .= "<h2>$langName</h2>\n";
	$return .= "<font color=\"#cccccc\">----------------</font>\n";
	$return .= "<ul>\n";

	#print other languages if available
	for (sort keys %languages) 
	{
		#except current language
		if($langSuffix ne $_) {
			#if found this document in other language show link
			if(-e "data/langs/$_/Pages/$currentPage") {
				#if it's english, don't print the "_en"
				if($_ eq "_en") {
					$return .= "<li><a href=\"$currentPage.html\">$languages{$_}</a>\n";
				} else {
					$return .= "<li><a href=\"$currentPage$_.html\">$languages{$_}</a>\n";
				}
			} else {
					$return .= "<li>$languages{$_} (pending)\n";
			}
		}
	}
	$return .= "</ul><br><br>\n";
	$return .= "</div></td></tr></table>\n";
	return $return;
}

sub getPeople {
	my ($myFile)= @_;
	my $return = "";

	open INFILE, "data/$myFile";
	while (<INFILE>) {
		$return .= $_;
	}
	close INFILE;
	return $return;
}
	

sub getLicense {
	my ($langSuffix, $authors, $colaborations, $contributors) = @_;
	my $return = "";
	
	open INFILE, "data/langs/$langSuffix/License";
	while (<INFILE>) {
		$return .= $_
	}
	close INFILE;

	#change code ":::authors:::" for $authors, and also for colaborations and contributions
	$return =~ s/:::authors:::/$authors/;
	$return =~ s/:::colaborations:::/$colaborations/;
	$return =~ s/:::contributors:::/$contributors/;
	
	return $return;
}

sub getSiteLinks {
	my ($pageContent)= @_;

	$pageContent =~ s/:::imageLink:::/$siteURL\/images/g;
	$pageContent =~ s/:::articleLink:::/$siteURL\/articles/g;
	$pageContent =~ s/:::webLink:::/$siteURL/g; #only used for 'accessible in' when pointing to bibliography web pages
	$pageContent =~ s/:::manualLink:::/$CVSURL\/manual/g;

	return $pageContent;
}
		
sub getConstants {
	my ($pageContent, $langSuffix)= @_;

	$pageContent =~ s/:::currentVersion:::/$currentVersion/g;
	$pageContent =~ s/:::linuxMailDownloadLink:::/$linuxMailDownloadLink/g;
	$pageContent =~ s/:::linuxMailDownloadName:::/$linuxMailDownloadName/g;
	$pageContent =~ s/:::windowsMailDownloadLink:::/$windowsMailDownloadLink/g;
	$pageContent =~ s/:::windowsMailDownloadName:::/$windowsMailDownloadName/g;
	$pageContent =~ s/:::changesMailDownloadLink:::/$changesMailDownloadLink/g;

	my $newDate = getLocalisedDate($langSuffix, $currentVersionDay, $currentVersionMonth, $currentVersionYear);
	$pageContent =~ s/:::currentVersionDate:::/$newDate/g;

	return $pageContent;
}
		
sub convertTitleAndPrintable {
	my ($pageContent, $langSuffix, $currentPage, $isPrintable) = @_;

	if($isPrintable eq "false") {
		my $printLinkName = &getPrintLinkName($langSuffix, $currentPage);
		$pageContent =~ s/:::startTitle:::/<table border=\"0\" width=\"100%\"><tr><td align=\"left\"><h4 id=\"top\">/g;
		$pageContent =~ s/:::endTitle:::/<\/h4><\/td><td align=\"right\">$printLinkName<\/td><\/tr><\/table>/g;
	} else {
		$pageContent =~ s/:::startTitle:::/<h4 id=\"top\">/g;
		$pageContent =~ s/:::endTitle:::/<\/h4>/g;
	}

	return $pageContent;
}

sub getPrintLinkName {
	my ($langSuffix, $currentPage) = @_;
	
	my $printName = "";
	open INFILE, "data/langs/$langSuffix/Print";
	while (<INFILE>) {
		$printName .= $_;
	}
	close INFILE;

	if($langSuffix eq "_en") {
		return "<a href=\"print/$currentPage.html\"><font size=\"2\"><tt>$printName</tt></font></a>";
	} else {
		return "<a href=\"print/$currentPage$langSuffix.html\"><font size=\"2\"><tt>$printName</tt></font></a>";
	}
}

sub getFooter {
	my ($langSuffix) = @_;

	my $translator = "";
	open INFILE, "data/langs/$langSuffix/Translator";
	while (<INFILE>) {
		$translator .= $_;
	}
	close INFILE;

	my $designed = "";
	open INFILE, "data/langs/$langSuffix/Designed";
	while (<INFILE>) {
		$designed .= $_;
	}
	close INFILE;


	my $return = "";
	$return .= "<div id=\"footer\">\n
		<hr width=\"98%\" noshade size=\"1\">
		<table align=\"center\" width=\"98%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n
		<tr><td align=\"left\">$translator</td><td>$designed</td></tr>\n
		</div>\n
		</body>\n
		</html>";

	return $return;
}

sub filterHTML {
	my ($return)= @_;
	
	#TODO: find a perl library that makes this
	
	#spanish
	$return =~ s/&/&/g;
	$return =~ s/á/&aacute;/g;
	$return =~ s/é/&eacute;/g;
	$return =~ s/í/&iacute;/g;
	$return =~ s/ó/&oacute;/g;
	$return =~ s/ú/&uacute;/g;
	$return =~ s/ñ/&ntilde;/g;
	$return =~ s/Á/&Aacute;/g;
	$return =~ s/É/&Eacute;/g;
	$return =~ s/Í/&Iacute;/g;
	$return =~ s/Ó/&Oacute;/g;
	$return =~ s/Ú/&Uacute;/g;
	$return =~ s/Ñ/&Ntilde;/g;
	#$return =~ s/¿/&iquest;/g;
	#$return =~ s/!/&#033;/g;
		
	#catalan
	$return =~ s/à/&agrave;/g;
	$return =~ s/è/&egrave;/g;
	$return =~ s/ò/&ograve;/g;
	$return =~ s/ï/&iuml;/g;
	$return =~ s/ü/&uuml;/g;
	$return =~ s/À/&Agrave;/g;
	$return =~ s/È/&Egrave;/g;
	$return =~ s/Ò/&Ograve;/g;
	$return =~ s/Ï/&Uuml;/g;
	$return =~ s/Ü/&Uuml;/g;
	$return =~ s/ç/&ccedil;/g;
	$return =~ s/Ç/&Ccedil;/g;
	$return =~ s/·/&middot;/g;

	#português
	$return =~ s/ã/&atilde;/g;
	$return =~ s/õ/&otilde;/g;
	$return =~ s/ê/&ecirc;/g;
	$return =~ s/ô/&ocirc;/g;

	#deutsch
	$return =~ s/Ä/&Auml;/g;
	$return =~ s/Ö/&Ouml;/g;
	$return =~ s/ä/&auml;/g;
	$return =~ s/ö/&ouml;/g;
	$return =~ s/ß/&szlig/g;
	
	
	return $return;
}

sub getLocalisedDate {
	my ($langSuffix, $day, $month, $year) = @_;

	my %english = ('1', 'January', '2', 'February', '3', 'March', '4', 'April', '5', 'May', '6', 'June', 
			'7', 'July', '8', 'August', '9', 'September', '10', 'October', '11', 'November', '12', 'December' );

	my %spanish = ('1', 'Enero', '2', 'Febrero', '3', 'Marzo', '4', 'Abril', '5', 'Mayo', '6', 'Junio', 
			'7', 'Julio', '8', 'Agosto', '9', 'Septiembre', '10', 'Octubre', '11', 'Noviembre', '12', 'Diciembre' );

	my %catalan = ('1', 'Gener', '2', 'Febrer', '3', 'Març', '4', 'Abril', '5', 'Maig', '6', 'Juny', 
			'7', 'Juliol', '8', 'Agost', '9', 'Septembre', '10', 'Octubre', '11', 'Novembre', '12', 'Desembre' );

	my %french = ('1', 'Janvier', '2', 'Février', '3', 'Mars', '4', 'Avril', '5', 'Mai', '6', 'Juin', 
			'7', 'Juilliet', '8', 'Aôut', '9', 'Septembre', '10', 'Octobre', '11', 'Novembre', '12', 'Décembre' );

	my %italian = ('1', 'gennaio', '2', 'febbraio', '3', 'marzo', '4', 'aprile', '5', 'maggio', '6', 'giugno', 
			'7', 'luglio', '8', 'agosto', '9', 'settembre', '10', 'ottobre', '11', 'novembre', '12', 'dicembre' );

	my %portuguese = ('1', 'janeiro', '2', 'fevereiro', '3', 'março', '4', 'abril', '5', 'maio', '6', 'junho',
			'7', 'julho', '8', 'agosto', '9', 'setembro', '10', 'outubro', '11', 'novembro', '12', 'dezembro' );

	my %gaelican = ('1', 'Xaneiro', '2', 'Febrero', '3', 'Marzo', '4', 'Abril', '5', 'Mayo', '6', 'Junio', 
			'7', 'Julio', '8', 'Agosto', '9', 'Septiembre', '10', 'Octubre', '11', 'Noviembre', '12', 'Diciembre' );

	my %deutsch = ('1', 'Januar', '2', 'Februar', '3', 'März', '4', 'April', '5', 'Mai', '6', 'Juni', 
			'7', 'Juli', '8', 'August', '9', 'September', '10', 'Oktober', '11', 'November', '12', 'Dezeember' );


	if($langSuffix eq "_en") {
		return "$english{$month}-$day-$year"; #english the only one MM-DD-YYYY (i think)
	} elsif($langSuffix eq "_es") {
		return "$day-$spanish{$month}-$year";
	} elsif($langSuffix eq "_ca") {
		return "$day-$catalan{$month}-$year";
	} elsif($langSuffix eq "_fr") {
		return "$day-$french{$month}-$year";
	} elsif($langSuffix eq "_it") {
		return "$day-$italian{$month}-$year";
	} elsif($langSuffix eq "_pt") {
		return "$day-$portuguese{$month}-$year";
	} elsif($langSuffix eq "_gl") {
		return "$day-$gaelican{$month}-$year";
	} elsif($langSuffix eq "_de") {
		return "$day-$deutsch{$month}-$year";
	} else {
		print "Date on $langSuffix not localized!!!";
		return "$english{$month}-$day-$year";
	}

}
