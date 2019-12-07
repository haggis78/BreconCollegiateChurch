<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Analysis</title>
            </head>
            <body>
                <h1>Analysis of textual relationships among witnesses</h1>
<h2> Introduction and methodology</h2>
                <p>No two manuscripts of a text will ever be quite identical. Each scribe will introduce variant readings, whether he is adding information, making a mistake, or trying to correct a mistake he sees in the exemplar from which he is copying. Carefully tracking these variants is central to editing a text that appears in multiple 'witnesses' (manuscripts and printings), especially where the original copy is lost. This enables the creation of a <em>stemma</em>, or family tree, showing which copies were made from which other copies, and can be used to determine which variants likely appeared in the lost original manuscript.</p> 
                <p>Thanks to our XML encoding, we can automatically count the frequency with which each witness agrees with each other witness. There are many different ways in which this could be calculated. We might either include or exclude morphological (spelling) differences, or might include some but not others. Where a whole phrase is present in some witnesses but absent in others, we might count that either as a single point of difference or as one difference per word. We could even count the differences on a letter-by-letter basis.</p>
                <p>The need for absolute precision is mitigated by the fact that we are not trying to generate our stemma in a purely mathematical fashion. Our purpose here is less ambitious: to get an impressionistic sense of the accuracy of scribes, to determine which witness or witnesses are closest to the lost original, and to generate hypotheses about the relationships among the copies. Such hypotheses can then be checked in the conventional way, by looking at individual examples of variations.</p>
                <p>Procedurally, it has been simplest to count all variations noted in the XML document, whether they are matters of syntax or word choice (<em>vel</em>, <em>seu</em>, <em>aut</em>, and <em>et</em> being interchanged, for example); certain spelling differences that we judged to be significant (especially different spellings of place names); and whole words or passages that are present in some witnesses and absent in others. Where a whole phrase is absent or present, we have encoded that as a single point of difference rather than counting the number of words or letters and treating each one as an individual point of difference. By looking at the comparison of texts, the reader can quickly see the type of variations we found and identified. </p>
                <p>We elected from the start to ignore certain other differences, particularly with regard to Witness R, the earliest copy we surveyed (the Patent Roll, c. 1541). This copy, though technically post-medieval, bore certain characteristics of medieval rather than classical/Renaissance-neoclassical Latin. Two in particular stand out. The first is the use of -e- alone where classical and neoclassical Latin would use -ae- or the ligatured -æ-. (The one time the scribe of R uses -ae- is in the context of the word <em>escaetorum</em>; this is a word borrowed from medieval French, apparently imported into English legal Latin after other -ae-s had been stripped down to -e-.) The other relates to the appearence of -c- or -t- in the middle of a word, especially where followed by an -i-. Not only did many medieval scribes interchange these letters: the similarity in their appearance in many hands (the c was often made with a horizontal cross-stroke and a separate vertical stroke which may or may not include a rightward curve at the bottom, similar to the way we write a -t- today) can make it impossible for the modern reader to tell which letter the scribe even intended, or even whether the scribe himself had a clear idea in each instance which letter he was writing. In the text of R that we prepared for comparison with the later witnesses, we re-inserted the -ae- and standardized c/t distinction. This is less than ideal in reconstructing the exact morphology and syntax of the lost Letter Patent, but because these differences occur so frequently, keeping them would have cluttered the data with a great many essentially meaningless variant readings (there are over 180 -æ-s and over 400 -ti-s, which together are more than double the number of more significant variant readings). Not only would this have made numerical differences in the data appear more slight: it would have meant tripling the numer of variants marked up in our XML, multiplying the opportunities for human error.</p>
                <p>Other differences that we chose not to encode include punctuation and capitalisation. These will vary naturally from one scribe to another based on personal preferences, so they do not help us determine who copied from whom. In the case of this particular text they also do not significantly influence the meaning of the Latin text. Further, in the period around 1700, when witnesses C, D, I, and O were written, scribes used multiple letter forms, and it is not always possible to determine whether a particular form was intended by the scribe to be a majuscule (capital) or miniscule (lower-case) letter. Finally, while all of the scribes (except in of witness D) used various forms of the ampersand rather than spelling out the word 'et', this too is a matter of scribal preference, and encoding these variants in our xml file would have been both tedious and unnecessary. We rendered all of these as 'et' in our xml file, as is normally considered best practice in editing medieval and early modern Latin texts. This meant ignoring the handful of times that a scribe wrote out 'et' instead.</p>
                <h2>Numerical analysis</h2>
                
                <p>To understand the relationships among the witnesses, we can first run a raw numerical analysis showing how often each witness agrees with each other witness. We can output this as a list of all possible combinations in tabular form. Each box shows the number of times each witness agrees with each other witness. Naturally, down the diagonal, each witness agrees with itself one hundred percent of the time [WHY ARE THESE NUMBERS NOT ALL THE SAME? NEED TO DEBUG]; and the table is symmetrical across that diagonal axis.</p>
                
                <table>
                    <tr>
                       <th>Witness</th> 
                        <th>R</th>
                        <th>W</th>
                        <th>S</th>
                        <th>J</th>
                        <th>C</th>
                        <th>D</th>
                        <th>I</th>
                        <th>O</th>
                    </tr>
                    <tr>
                        <td>R</td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'R') and contains (@wit, 'R')])"></xsl:value-of></td>
                        <td style="background-color: #ffff66;"><xsl:value-of select="count(//rdg[contains(@wit, 'R') and contains (@wit, 'W')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'R') and contains (@wit, 'S')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'R') and contains (@wit, 'J')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'R') and contains (@wit, 'C')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'R') and contains (@wit, 'D')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'R') and contains (@wit, 'I')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'R') and contains (@wit, 'O')])"></xsl:value-of></td>                                            </tr>
                    <tr>
                        <td>W</td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'W') and contains (@wit, 'R')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'W') and contains (@wit, 'W')])"></xsl:value-of></td>
                        <td style="background-color: #ff66cc;"><xsl:value-of select="count(//rdg[contains(@wit, 'W') and contains (@wit, 'S')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'W') and contains (@wit, 'J')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'W') and contains (@wit, 'C')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'W') and contains (@wit, 'D')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'W') and contains (@wit, 'I')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'W') and contains (@wit, 'O')])"></xsl:value-of></td>                                            </tr>
                    <tr>
                        <td>S</td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'S') and contains (@wit, 'R')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'S') and contains (@wit, 'W')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'S') and contains (@wit, 'S')])"></xsl:value-of></td>
                        <td style="background-color: #ff66cc;"><xsl:value-of select="count(//rdg[contains(@wit, 'S') and contains (@wit, 'J')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'S') and contains (@wit, 'C')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'S') and contains (@wit, 'D')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'S') and contains (@wit, 'I')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'S') and contains (@wit, 'O')])"></xsl:value-of></td>                                            </tr>
                    <tr>
                        <td>J</td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'J') and contains (@wit, 'R')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'J') and contains (@wit, 'W')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'J') and contains (@wit, 'S')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'J') and contains (@wit, 'J')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'J') and contains (@wit, 'C')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'J') and contains (@wit, 'D')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'J') and contains (@wit, 'I')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'J') and contains (@wit, 'O')])"></xsl:value-of></td>                                            </tr>
                    <tr>
                        <td>C</td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'C') and contains (@wit, 'R')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'C') and contains (@wit, 'W')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'C') and contains (@wit, 'S')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'C') and contains (@wit, 'J')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'C') and contains (@wit, 'C')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'C') and contains (@wit, 'D')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'C') and contains (@wit, 'I')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'C') and contains (@wit, 'O')])"></xsl:value-of></td>                                            </tr>
                    <tr>
                        <td>D</td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'D') and contains (@wit, 'R')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'D') and contains (@wit, 'W')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'D') and contains (@wit, 'S')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'D') and contains (@wit, 'J')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'D') and contains (@wit, 'C')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'D') and contains (@wit, 'D')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'D') and contains (@wit, 'I')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'D') and contains (@wit, 'O')])"></xsl:value-of></td>                                            </tr>
                    <tr>
                        <td>I</td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'I') and contains (@wit, 'R')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'I') and contains (@wit, 'W')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'I') and contains (@wit, 'S')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'I') and contains (@wit, 'J')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'I') and contains (@wit, 'C')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'I') and contains (@wit, 'D')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'I') and contains (@wit, 'I')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'I') and contains (@wit, 'O')])"></xsl:value-of></td>                                            </tr>
                    <tr>
                        <td>O</td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'O') and contains (@wit, 'R')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'O') and contains (@wit, 'W')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'O') and contains (@wit, 'S')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'O') and contains (@wit, 'J')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'O') and contains (@wit, 'C')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'O') and contains (@wit, 'D')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'O') and contains (@wit, 'I')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'O') and contains (@wit, 'O')])"></xsl:value-of></td>                                            </tr>
                    
                    
                </table>
                
                
                <h2>Discussion</h2>
                <p>One finding that immediately springs from these data is that W, S, and J, the three printings, form an independent branch of the tree. This is visible in the table where the squares are highlighted in pink: where there are variations among the witnesses, W and S agree <span style="background-color: #ff66cc;"><xsl:value-of select="count(//rdg[contains(@wit, 'W') and contains (@wit, 'S')])"></xsl:value-of></span> times, and S and J agree <span style="background-color: #ff66cc;"><xsl:value-of select="count(//rdg[contains(@wit, 'S') and contains (@wit, 'J')])"></xsl:value-of></span> times.  Looking down the WSJ columns, we can see that these three agree with one another more frequently than they agree with any of the manuscript witnesses. We had predicted this in advance, as the citations within these printed witnesses themselves establish their dependency: S cites W, and J cites S. Of the three, W is closest to R, S is a bit further, J is further still. This is exactly what we would expect: a certain amount of drift as transcription errors crept in. Since the relationship among these witnesses was already known, this serves as a successful test of the process of counting variants to indicate relationships. </p>
                <p>If we measure accuracy as closeness to R, we can also judge which is the most accurate witness. This is an important question, and one that we could not have predicted in advance. We find (highlighted in yellow) that the witness that shares the most readings with R is W. These two witnesses agree <span style="background-color: #ffff66;"><xsl:value-of select="count(//rdg[contains(@wit, 'W') and contains (@wit, 'R')])"></xsl:value-of></span> times. This means that Browne Willis' transcription, however he came by it, is almost certainly the most accurate of all the later copies. Even S and J, though they import additional variants due to typographical errors (and, in one case in J, a misguided attempt to add a phrase that the author <b>thought</b> should have been there), still show more fidelity to R than <em>any</em> of the CDIO manuscripts.</p>
                <p>When we consider the later manuscript witnesses CDIO, we still do not know who was the first to include the Letters Patent establishing Christ College Brecon as an appendix to the Statutes of St Davids Cathedral, which is the main text that CDIO carry. We also do not know exactly when CDIO were copied, though all belong to the very late 1600s or first few decades of the 1700s. For all we know, the first scribe to include the Brecon document <em>could</em> have been copying it from W, which was printed in 1719, rather than copying independently from some other manuscript source; or W <em>could</em> have gotten his text from one of our known manuscripts CDIO. It appears that this did not happen. The fact that these are two distinct families of witnesses, representing a fork in the tree, shows that neither of these possibilities is true. The numerical indications in the comparative data are suggestive, but firmer evidence for this can be found in the texts, particularly in the first and last sections of the document. The three printed witnesses, WSJ, give only an abbreviated salutation, beginning 'Rex omnibus', while CDIO preserve the full salutation, beginning 'Henricus Octavus'. Each family also abbreviates the final clauses, beginning 'In cujus rei testimonium', slightly differently, preserving some but not all of the information that the lost original Letters Patent would have carried. </p>
                    <p>We still do not know exactly how Browne Willis (the author who published witness W) and the first of the CDIO scribes had access to the text: did they have transcripts of the original Letters Patent? Did they have access to the original document itself, now lost? Nonetheless, the independence of these two families of witnesses is very convenient for us, as it means that there are three different angles from which to try to reconstruct the original text. R is a file copy, prepared from X, the Warrant in Chancery, which served as the rough draft of the original Letters Patent. Willis and the earliest CDIO scribe worked independently, probably from different transcripts made from the original. Where R, W, and CDIO agree, they give us the original text; where two of the three families agree with one another, they most likely give us the original text, and the third may be an outlier; and even where there is complete disagreement, it is likely that at least <emph>one</emph> gives us the correct original reading, and careful reading of the Latin can help to narrow down the options to the most likely one.</p>
                <p>Let us look in more detail at the relationships among CDIO. The principal text in these manuscripts, the Statutes of St Davids Cathedral, has never been fully edited. Any edition will have to use these manuscripts: although there are three older manuscripts in existence, all three are damaged and illegible in parts. The editor would thus have to look at manuscripts CDIO to help fill in the blanks. It will be necessary to determine the relationships among these manuscripts: which is the earliest, who copied from whom, and which is the most reliable. In fact, the whole Christ College Brecon project was conceived as a case study to get at this very question. Let us begin by simplifying our table by removing the printed witnesses WSJ.</p>
                
                
                <table>
                    <tr>
                        <th>Witness</th> 
                        <th>R</th>
                       <th>C</th>
                        <th>D</th>
                        <th>I</th>
                        <th>O</th>
                    </tr>
                    <tr>
                        <td>R</td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'R') and contains (@wit, 'R')])"></xsl:value-of></td>
                       <td><xsl:value-of select="count(//rdg[contains(@wit, 'R') and contains (@wit, 'C')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'R') and contains (@wit, 'D')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'R') and contains (@wit, 'I')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'R') and contains (@wit, 'O')])"></xsl:value-of></td>                                            </tr>
                                        <tr>
                        <td>C</td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'C') and contains (@wit, 'R')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'C') and contains (@wit, 'C')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'C') and contains (@wit, 'D')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'C') and contains (@wit, 'I')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'C') and contains (@wit, 'O')])"></xsl:value-of></td>                                            </tr>
                    <tr>
                        <td>D</td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'D') and contains (@wit, 'R')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'D') and contains (@wit, 'C')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'D') and contains (@wit, 'D')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'D') and contains (@wit, 'I')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'D') and contains (@wit, 'O')])"></xsl:value-of></td>                                            </tr>
                    <tr>
                        <td>I</td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'I') and contains (@wit, 'R')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'I') and contains (@wit, 'C')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'I') and contains (@wit, 'D')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'I') and contains (@wit, 'I')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'I') and contains (@wit, 'O')])"></xsl:value-of></td>                                            </tr>
                    <tr>
                        <td>O</td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'O') and contains (@wit, 'R')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'O') and contains (@wit, 'C')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'O') and contains (@wit, 'D')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'O') and contains (@wit, 'I')])"></xsl:value-of></td>
                        <td><xsl:value-of select="count(//rdg[contains(@wit, 'O') and contains (@wit, 'O')])"></xsl:value-of></td>                                            </tr>
                    
                    
                </table>
                
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>