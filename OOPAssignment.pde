/*OOP Assignment 1
Thomas O'Connor
C13431468
*/

String [] years ={"2006","2007","2008","2009","2010","2011","2013","2014","2015"};
Boolean barGraph = true;

float value;
int count=0;
int sum=0;
int high=0, low=1000;
int indexHigh;
int indexLow;

color randomColor()
{
  return color(random(0, 255), random(0, 255), random(0, 255));
} 
void setup()
{
  background(0);
  size(500, 500);
  fill(255);
  
  //reading in the data set
  ArrayList<float> arrayList=new ArrayList<float>();
  String[] rankings=loadStrings("Ireland_Rankings.csv");
  for(int i=0; i<arrayList.size(); i++)
  {
    count++;
    sum+=arrayList.get(i);
      if(arrayList.get(i)<low)
     {
       low=arrayList.get(i);
       indexLow=i;
     }
     if(arrayList.get(i)>high)
     {
       high=arrayList.get(i); 
       indexHigh=i;
     }
  }
 for(String x:rankings)
  {
    values=x;
    int values= values;
    arrayList.add(values);
  }
  //Drawing the Line Graph
  if(barGraph==false)
  {
      float edge = width * 0.1f; 
      stroke(200);
      fill(200);
      axis(arrayList, years, 15, 70, edge);
      float size = (width - (edge * 2.0f));
      float max = 70;      
      float Length =  size / (float) (years.length - 1) ;
      float scale = size / max;
      for (int i = 1 ; i < arrayList.size() ; i ++)
      {
        float x1 = edge + ((i - 1) * Line);
        float x2 = edge + (i * Line);
        float y1 = (height - edge) - (arrayList.get(i - 1)) * scale;
        float y2 = (height - edge) - (arrayList.get(i)) * scale;
        line(x1, y1, x2, y2);
      }
  }
  //Drawing the Bar Graph
  if(barGraph==true)
  {
    for (int i = 0 ; i < arrayList.size() ; i ++)
    {
      float x = (i * barWidth) + border;
      stroke(random(0, 255), random(0, 255), random(0, 255));
      fill(random(0, 255), random(0, 255), random(0, 255));
      rect(x, height - border, barWidth, - arrayList * scale);
    }
  }
    // Title Text
    textSize(24);
    textAlign(CENTER);
    fill(0);
    text("Rankings 2006-2015", width/2, height/6);
    
    //Toggle Button to display bar or line graph
    color C = color randomColor();
    if (barGraph)
    {
      fill(C);
      rect(width*.8, height/25, 100, 25);
      
      //text during bar graph view
      textSize(10);
      fill(0);
      text("switch to line graph", width*.8+50, height/25+13);
  
    }
    else
    {
      fill(C);
      rect(width*.8, height/25, 100, 25);
      textSize(10);
      text("switch to bar graph", width*.8+50, height/25+13);
    }    
}

//using arrays for the axis
float[] rankings = {24, 35, 38, 35, 36, 22, 42, 67, 70, 42}; 
int[] years = {2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015};

//drawing the axis for the graphs
void drawAxis(float[] data, int[] horizontalLabels, int verticalIntervals, float vertDataRange, float border)
{
  stroke(200, 200, 200);
  fill(200, 200, 200);  
  
  //Drawing the horizontal axis  
  line(border, height - border, width - border, height - border);
  
  float windowRange = (width - (border * 2.0f));  
  float horizontalInterval =  windowRange / (data.length - 1);
  float tickSize = border * 0.1f;
  
    
  for (int i = 0 ; i < data.length ; i ++)
  {   
   //Drawing the ticks
   float x = border + (i * horizontalInterval);
   line(x, height - (border - tickSize), x, (height - border));
   float textY = height - (border * 0.5f);
   
   //Printing the text
   textAlign(CENTER, CENTER);
   text(horizontalLabels[i], x, textY);
   
  }
  
  //Drawing the vertical axis
  line(border, border , border, height - border);
  
  float verticalDataGap = vertDataRange / verticalIntervals;
  float verticalWindowRange = height - (border * 2.0f);
  float verticalWindowGap = verticalWindowRange / verticalIntervals; 
  for (int i = 0 ; i <= verticalIntervals ; i ++)
  {
    float y = (height - border) - (i * verticalWindowGap);
    line(border - tickSize, y, border, y);
    float hAxisLabel = verticalDataGap * i;
        
    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }  
}
void mouseClicked()
{
  // click from Bar graph to Line graph
  if (barGraph)
  {
      if (mouseX > width*.8 && mouseX < (width*.8)+100 && mouseY > height/25 && mouseY < height/25+25)
      {
         barGraph = false;
      }
  }
  else
  {
    // Click from Line graph to Bar graph
      if (mouseX > width*.8 && mouseX < (width*.8)+100 && mouseY > height/25 && mouseY < height/25+25)
      {
        barGraph = true;
      }
  }
}

