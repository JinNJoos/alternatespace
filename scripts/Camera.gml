#define Camera
//set argument variables
//agrument0 - distance between the object and the side of the view before the view resizes horizontaly
//argument1 - distance between the object and the side of the view before the view resizes verticly
//argument2 - the view's speed
//argument3 - how many times larger the view can get compared to the inital size of the view (set in view tab in room window,) (if this is 2, the view can get twice as large, if it is 3, it can get three times larger, ect..)
//argument4 - the name of the parent of the characters
//argument5 - wether or not the characters are fallowed by the view when they are created (1 they are, 0 they are not)
//argument6 - minimal x value of the view
//argument7 - minimal y value of the view
//argument8 - maximum x value of the view
//argument9 - maximum y value of the view
active1sGjHHjd3kLL=-1
min_viewx=argument6
min_viewy=argument7
max_viewx=argument8
max_viewy=argument9
xoffset=argument0
yoffset=argument1
max_view_speed=argument2
max_view_wview=view_wview*argument3
max_view_hview=view_hview*argument3
camera_object=id
parent_object=argument4
active_default=argument5

//create the object that the view actualy fallows ("looker" object)
looker=instance_create(x,y,camera_looker)

//set some other variables
ratio=view_wview/view_hview
orig_view_wview=view_wview
orig_view_hview=view_hview
last_view_wview=view_wview
last_view_hview=view_hview
curid=0

#define set_view
//Made by: Michael Moore. GIVE CREDIT!!!

//update the "looker" object
with looker
 {
 //calculate Speed
 spd=point_distance(x,y,other.camera_object.x,other.camera_object.y)
 
 //restrain speed
 if spd>other.camera_object.max_view_speed
  spd=other.camera_object.max_view_speed
 
 //move towards the point
 move_towards_point(other.camera_object.x,other.camera_object.y,spd)
 }

//set the active variables and arrow variables for the characters
with parent_object
 {
 if id>other.curid
  {
  active1sGjHHjd3kLL=other.active_default
  other.curid=id
  }
 }

//if there are no characters
if instance_number(parent_object)=0
 {
 //just set the view position
 view_xview=looker.x-(view_wview/2)
 view_yview=looker.y-(view_hview/2)
 }

//if there is 1 character
if instance_number(parent_object)=1 
 {
 //if the character is active
 if parent_object.active1sGjHHjd3kLL=true
  {
  //just fallow that character
  x=parent_object.x
  y=parent_object.y
 
  //set the size the view needs to strech to be the original size
  goto_view_wview=orig_view_wview
  goto_view_hview=orig_view_hview
  
  //strech the view to be what it is supposed to be
  xdist=view_wview-goto_view_wview
  if xdist>20
   xdist=20
  ydist=view_hview-goto_view_hview
  if ydist>20
   ydist=20
  
  if view_wview>goto_view_wview or view_wview<goto_view_wview
   view_wview-=xdist
  if view_hview>goto_view_hview or view_hview<goto_view_hview
   view_hview-=ydist
  
  //keep camera in the center of the view
  view_xview=looker.x-(view_wview/2)
  view_yview=looker.y-(view_hview/2)
  }
 else
  {
  view_xview=looker.x-(view_wview/2)
  view_yview=looker.y-(view_hview/2)
  }
 }

//if there are 2 OR MORE characters
if instance_number(parent_object)>=2
 {
 find_extremes()
 
 //if the graitest and least x and y values are out of the screen, set the variables to be inside the screen
 if left_most<view_xview-xoffset/1.5
  left_most=view_xview-xoffset/1.5
 if right_most>view_xview+view_wview+xoffset/1.5
  right_most=view_xview+view_wview+xoffset/1.5
 if top_most<view_yview+yoffset
  top_most=view_yview+yoffset
 if bottom_most>view_yview+view_hview-yoffset
  bottom_most=view_yview+view_hview-yoffset
 
 //set camera to be inbetween the farthest charecters
 x=left_most+((right_most-left_most)/2)
 y=top_most+((bottom_most-top_most)/2)
 
 
 //set the size the view needs to strech to to see all charecters
 if (left_most-right_most>0 and xoffset<0) or (left_most-right_most<0 and xoffset>0)
  xoffset*=-1
 if (top_most-bottom_most<0 and yoffset>0) or (top_most-bottom_most>0 and yoffset<0)
  yoffset*=-1
 goto_view_wview=abs(left_most+xoffset-right_most+xoffset)
 goto_view_hview=abs(top_most+yoffset-bottom_most+yoffset)
 
 //strech the view to what it is supposed to be
 xdist=view_wview-goto_view_wview
 if xdist>max_view_speed
  xdist=max_view_speed
 if xdist<-max_view_speed
  xdist=-max_view_speed
 ydist=view_hview-goto_view_hview
 if ydist>max_view_speed
  ydist=max_view_speed
 if ydist<-max_view_speed
  ydist=-max_view_speed
 
 if view_wview>goto_view_wview or view_wview<goto_view_wview
  view_wview-=xdist
 if view_hview>goto_view_hview or view_hview<goto_view_hview
  view_hview-=ydist

 //keep from zooming in too much
 if view_wview<orig_view_wview
  view_wview=orig_view_wview
 if view_hview<orig_view_hview
  view_hview=orig_view_hview
  
 //keep from zooming out too much
 if view_wview>max_view_wview
  view_wview=max_view_wview
 if view_hview>max_view_hview
  view_hview=max_view_hview
 
 //keep aspect ratio
 if (view_wview-last_view_wview)>(view_hview-last_view_hview)
  view_hview=view_wview/ratio
 else
  view_wview=last_view_hview*ratio
  
 //set varialbles
 last_view_wview=view_wview
 last_view_hview=view_hview
  
 //keep camera in the center of the view
 view_xview=looker.x-(view_wview/2)
 view_yview=looker.y-(view_hview/2)
 
 //Keep within minimal and maximum cordinates
 if view_xview<min_viewx
  view_xview=min_viewx
 if view_xview+view_wview>max_viewx
  view_xview=max_viewx-view_wview
 if view_yview<min_viewy
  view_yview=min_viewy
 if view_yview+view_hview>max_viewy
  view_yview=max_viewy-view_hview
 }

//create scale variable
global.scale=view_wview/orig_view_wview
//Made by: Michael Moore. GIVE CREDIT!!!

#define find_extremes
//Made by: Mike Moore. GIVE CREDIT!!
//DO NOT CHANGE
//--------FINDING THE INFORMATION--------

//Create variables with unlikely values
vxmin=-9999999.123
vxmax=-9999999.123
vymin=-9999999.123
vymax=-9999999.123
//go through each object, if the object's values are greater or less than the previous value set the new value to the object's values.
with parent_object
 {
 if active1sGjHHjd3kLL=true
  {
  if x<other.vxmin || other.vxmin=-9999999.123
   other.vxmin=x
  if x>other.vxmax || other.vxmax=-9999999.123
   other.vxmax=x
  if y<other.vymin || other.vymin=-9999999.123
   other.vymin=y
  if y>other.vymax || other.vymax=-9999999.123
   other.vymax=y
  }
 }

left_most=vxmin 
right_most=vxmax
top_most=vymin
bottom_most=vymax
//Made by: Mike Moore. GIVE CREDIT!!

#define set_following
//Use this script to tell the system to include or not include one of the characters when it is finding the view
//argument0 - the name of the object to set wether or not the view fallows it
//argument1 - wether or not it is included

argument0.active1sGjHHjd3kLL=argument1

#define get_following
//Use this script to find out wether the view is fallowing a characher (1) or not (0)
//argument0 - the name of the object

with argument0
 {
 if not (active1sGjHHjd3kLL=-1)
  argument1=0
 else
  argument1=active1sGjHHjd3kLL
 }

return argument1