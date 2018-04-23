using System;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxScheduler;
using DevExpress.Web.ASPxScheduler.Drawing;

public partial class VerticalAppointmentTemplate : System.Web.UI.UserControl {
	VerticalAppointmentTemplateContainer Container { get { return (VerticalAppointmentTemplateContainer)Parent; } }
	VerticalAppointmentTemplateItems Items { get { return Container.Items; } }

	protected void Page_Load(object sender, EventArgs e) {
		appointmentDiv.Style.Value = Items.AppointmentStyle.GetStyleAttributes(Page).Value;
		horizontalSeparator.Style.Value = Items.HorizontalSeparator.Style.GetStyleAttributes(Page).Value;

		lblStartTime.ControlStyle.MergeWith(Items.StartTimeText.Style);
		lblEndTime.ControlStyle.MergeWith(Items.EndTimeText.Style);
		lblTitle.ControlStyle.MergeWith(Items.Title.Style);
		lblDescription.ControlStyle.MergeWith(Items.Description.Style);

		statusContainer.Controls.Add(Items.StatusControl);
		LayoutAppointmentImages();		
	}
	void LayoutAppointmentImages() {
		int count = Items.Images.Count;
		for (int i = 0; i < count; i++) {
			HtmlTableRow row = new HtmlTableRow();
			HtmlTableCell cell = new HtmlTableCell();
			AddImage(cell, Items.Images[i]);
			row.Cells.Add(cell);
			imageContainer.Rows.Add(row);
		}
	}
	void AddImage(HtmlTableCell targetCell, AppointmentImageItem imageItem) {
		Image image = new Image();
		imageItem.ImageProperties.AssignToControl(image, false);
		targetCell.Controls.Add(image);
	}	
}