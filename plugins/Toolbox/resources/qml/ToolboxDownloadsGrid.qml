// Copyright (c) 2018 Ultimaker B.V.
// Toolbox is released under the terms of the LGPLv3 or higher.

import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import UM 1.1 as UM

Column
{
    height: childrenRect.height + 2 * padding
    width: parent.width
    spacing: UM.Theme.getSize("default_margin").height
    padding: UM.Theme.getSize("wide_margin").height
    Label
    {
        id: heading
        text: toolbox.viewCategory == "material" ? catalog.i18nc("@label", "Community contributions") : catalog.i18nc("@label", "Community plugins")
        width: parent.width
        color: UM.Theme.getColor("text_medium")
        font: UM.Theme.getFont("medium")
    }
    GridLayout
    {
        id: grid
        property var model: toolbox.viewCategory == "material" ? toolbox.authorsModel : toolbox.packagesModel
        width: parent.width - 2 * parent.padding
        columns: 2
        columnSpacing: UM.Theme.getSize("default_margin").height
        rowSpacing: UM.Theme.getSize("default_margin").width
        Repeater
        {
            model: grid.model
            delegate: ToolboxDownloadsGridTile
            {
                Layout.preferredWidth: (grid.width - (grid.columns - 1) * grid.columnSpacing) / grid.columns
                Layout.preferredHeight: UM.Theme.getSize("toolbox_thumbnail_small").height
            }
        }
    }
}
