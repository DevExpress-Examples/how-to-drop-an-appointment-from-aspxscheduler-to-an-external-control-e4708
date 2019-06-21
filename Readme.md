<!-- default file list -->
*Files to look at*:

* [CustomEvents.cs](./CS/WebSite/App_Code/CustomEvents.cs) (VB: [CustomEvents.vb](./VB/WebSite/App_Code/CustomEvents.vb))
* [Helpers.cs](./CS/WebSite/App_Code/Helpers.cs) (VB: [Helpers.vb](./VB/WebSite/App_Code/Helpers.vb))
* [CustomVerticalAppointmentTemplate.ascx](./CS/WebSite/CustomForms/CustomVerticalAppointmentTemplate.ascx) (VB: [CustomVerticalAppointmentTemplate.ascx](./VB/WebSite/CustomForms/CustomVerticalAppointmentTemplate.ascx))
* [CustomVerticalAppointmentTemplate.ascx.cs](./CS/WebSite/CustomForms/CustomVerticalAppointmentTemplate.ascx.cs) (VB: [CustomVerticalAppointmentTemplate.ascx.vb](./VB/WebSite/CustomForms/CustomVerticalAppointmentTemplate.ascx.vb))
* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# How to drop an appointment from ASPxScheduler to an external control
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e4708/)**
<!-- run online end -->


<p>This example illustrates how to drag and drop appointment info outside the ASPxScheduler area. The main difficulty of implementing this functionality is that the capability to drag appointments within the ASPxScheduler is built-in (see <a href="http://documentation.devexpress.com/#AspNet/CustomDocument3823">Appointments</a>) and can conflict with our implementation. Of course, we can disable this capability by setting the <a href="http://documentation.devexpress.com/#CoreLibraries/DevExpressXtraSchedulerSchedulerOptionsCustomization_AllowAppointmentDragtopic">SchedulerOptionsCustomization.AllowAppointmentDrag Property</a> to the <strong>UsedAppointmentType.None</strong> value. However, it is not an elegant solution. Instead, we will add a special "Drag panel" DIV to an appointment template (see <a href="http://documentation.devexpress.com/#AspNet/CustomDocument4220">How to: Customize Appointment Appearance via Templates</a>) and disable the built-in drag-and-drop functionality in its client-side <strong>onmousedown </strong>event handler by executing the following code:<br><br></p>


```js
// Prior to v15.1:
setTimeout('if (__aspxDragHelper != null) __aspxDragHelper.cancelDrag();', 0);
// Starting with v15.1:
setTimeout('if (ASPx.currentDragHelper != null) ASPx.currentDragHelper.cancelDrag();', 0);
// Starting with v15.2:
setTimeout('scheduler.mouseHandler.SwitchToDefaultState();', 0);
```


<p><br>We attach <a href="http://jqueryui.com/draggable/">Draggable</a> interaction from jQuery to our "Drag panel" so that it can be dragged. The DIV with the <a href="http://documentation.devexpress.com/#AspNet/clsDevExpressWebASPxEditorsASPxListBoxtopic">ASPxListBox</a> inside (in the main page' markup) serves as a drop target. We attach <a href="http://jqueryui.com/droppable/">Droppable</a> interaction to it. The source code looks pretty simple:</p>
<p> </p>


```js
            function InitalizejQuery(s, e) {
                $('.draggable').draggable({ helper: 'clone', appendTo: 'body', zIndex: 100 });
                $('.droppable').droppable({
                        activeClass: "dropTargetActive",
                        hoverClass: "dropTargetHover",
                        
                        drop: function (ev, ui) {
                            var appointmentId = $(ui.draggable).find("input[type='hidden']").val();
                            listBox.AddItem(appointmentId);
                            // Additional logic goes here...
                        }
                    }
                );
            }
```


<p> </p>
<p>The appointment Id is passed via the hidden field.</p>
<p> </p>
<p>The <strong>InitalizejQuery</strong> method is called from the client-side <strong>ControlsInitialized </strong>and <strong>EndCallback </strong>event handlers of the <a href="http://documentation.devexpress.com/#AspNet/clsDevExpressWebASPxGlobalEventsASPxGlobalEventstopic">ASPxGlobalEvents Class</a>. It is a recommended technique to perform jQuery-related actions with our controls (see <a href="https://www.devexpress.com/Support/Center/p/E3325">ASPxTextBox - How to attach the jQuery AutoComplete plugin</a>).</p>
<p> </p>
<p>Here is a screenshot that illustrates a sample application in action during our custom drag-and-drop operation:</p>
<p> </p>
<p><img src="https://raw.githubusercontent.com/DevExpress-Examples/how-to-drop-an-appointment-from-aspxscheduler-to-an-external-control-e4708/13.1.5+/media/ea5c6768-7a99-4200-a7b1-eab2c96b38d9.png"></p>
<p> </p>
<p><strong>See Also:</strong></p>
<p><a href="https://www.devexpress.com/Support/Center/p/E4292">ASPxScheduler - How to drag a row from ASPxGridView and create an appointment based on its values</a></p>
<p><a href="https://www.devexpress.com/Support/Center/p/E4746">How to drop an appointment from an external control onto an ASPxScheduler</a></p>

<br/>


