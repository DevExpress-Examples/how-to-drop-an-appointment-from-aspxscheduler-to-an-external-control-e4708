<%@ Control Language="vb" AutoEventWireup="true" Inherits="VerticalAppointmentTemplate" CodeFile="CustomVerticalAppointmentTemplate.ascx.vb" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v13.1" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<div id="appointmentDiv" runat="server" class='<%#CType(Container, VerticalAppointmentTemplateContainer).Items.AppointmentStyle.CssClass%>'>
    <div class="draggable" style="background: blue;" onmousedown="DragPanelHold();">
        <asp:Literal runat="server" ID="Literal1" Text="&nbsp;&nbsp;Drag panel" />
        <input type="hidden" value='<%#CType(Container, VerticalAppointmentTemplateContainer).AppointmentViewInfo.Appointment.Id%>' />
    </div>
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr valign="top" >
            <td runat="server" id="statusContainer">    
            </td>
            <td style="width:100%">
                <table cellpadding="1" cellspacing="0" width="100%">
                    <tr valign="top">
                        <td>
                            <table id="imageContainer" runat="server" cellpadding="1" cellspacing="0" style="text-align: center">
                                <tr><td></td></tr>
                            </table>
                        </td>
                        <td style="width:100%">                    
                            <table width="100%" cellpadding="1" cellspacing="0" >                        
                                <tr>
                                    <td>
                                        <dxe:ASPxLabel runat="server" EnableViewState="false" EncodeHtml="true" ID="lblStartTime" Text='<%#CType(Container, VerticalAppointmentTemplateContainer).Items.StartTimeText.Text%>' Visible='<%#CType(Container, VerticalAppointmentTemplateContainer).Items.StartTimeText.Visible%>'></dxe:ASPxLabel>
                                        <dxe:ASPxLabel runat="server" EnableViewState="false" EncodeHtml="true" style="margin-left: -4px;" ID="lblEndTime" Text='<%#CType(Container, VerticalAppointmentTemplateContainer).Items.EndTimeText.Text%>' Visible='<%#CType(Container, VerticalAppointmentTemplateContainer).Items.EndTimeText.Visible%>'></dxe:ASPxLabel>        
                                        <dxe:ASPxLabel runat="server" EnableViewState="false" EncodeHtml="true" ID="lblTitle" Text='<%#CType(Container, VerticalAppointmentTemplateContainer).Items.Title.Text%>'></dxe:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div runat="server" id="horizontalSeparator" class='<%#CType(Container, VerticalAppointmentTemplateContainer).Items.HorizontalSeparator.Style.CssClass%>' visible='<%#CType(Container, VerticalAppointmentTemplateContainer).Items.HorizontalSeparator.Visible%>'></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dxe:ASPxLabel runat="server" EnableViewState="false" EncodeHtml="true" ID="lblDescription" Text='<%#CType(Container, VerticalAppointmentTemplateContainer).Items.Description.Text%>'></dxe:ASPxLabel>
                                    </td>        
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</div>