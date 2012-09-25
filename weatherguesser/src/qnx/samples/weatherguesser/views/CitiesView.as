/*
* Copyright (c) 2012 Research In Motion Limited.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
package qnx.samples.weatherguesser.views
{
	import qnx.fuse.ui.core.Action;
	import qnx.fuse.ui.core.ActionBase;
	import qnx.fuse.ui.core.ActionSet;
	import qnx.fuse.ui.core.SizeOptions;
	import qnx.fuse.ui.events.ActionEvent;
	import qnx.fuse.ui.events.ContextMenuEvent;
	import qnx.fuse.ui.events.ListEvent;
	import qnx.fuse.ui.layouts.Align;
	import qnx.fuse.ui.layouts.gridLayout.GridData;
	import qnx.fuse.ui.listClasses.ListSelectionMode;
	import qnx.fuse.ui.listClasses.SectionList;
	import qnx.fuse.ui.navigation.NavigationPaneProperties;
	import qnx.samples.weatherguesser.Assets;
	import qnx.samples.weatherguesser.model.Cities;
	import qnx.samples.weatherguesser.model.Weather;

	/**
	 * @author juliandolce
	 */
	public class CitiesView extends TitlePage
	{
		
		private var favAction:Action;
		private var homeAction:Action;
		private var __contextMenuOpen:Boolean;
		
		protected var list:SectionList;

		override public function set title( value:String ):void
		{
			super.title = value;
			if( list != null )
			{
				list.dataProvider = Cities.getCities( value );
			}
		}

		public function CitiesView()
		{
			super();
		}

		override protected function init():void
		{
			super.init();
			
			
			
			var prop:NavigationPaneProperties = new NavigationPaneProperties();
			prop.backButton = new Action( "Names" );
			paneProperties = prop;

			
			
			
		}
		
		
		override protected function onAdded():void
		{
			super.onAdded();
			
			favAction = new Action("Favorite", new Assets.ICON_FAVORITE() );
			homeAction = new Action("Home City", new Assets.ICON_HOME() );
			
			list = new SectionList();
			list.selectionMode = ListSelectionMode.SINGLE;
			list.addEventListener( ListEvent.ITEM_CLICKED, listClicked );
			list.addEventListener( ContextMenuEvent.CLOSING, contextMenuClosing );
			list.addEventListener( ContextMenuEvent.OPENING, contextMenuOpening );
			list.addEventListener( ActionEvent.ACTION_SELECTED, contextMenuSelected );

			var listData:GridData = new GridData();
			listData.hAlign = Align.FILL;
			listData.setOptions( SizeOptions.RESIZE_BOTH );

			list.layoutData = listData;

			content.addChild( list );
			
			var actionSet:ActionSet = new ActionSet();
			
			actionSet.subtitle = "City Actions";
			
			var actions:Vector.<ActionBase> = new Vector.<ActionBase>();
			actions.push( favAction );
			actions.push( homeAction );
			
			actionSet.actions = actions;
			
			var contextActions:Vector.<ActionSet> = new Vector.<ActionSet>();
			contextActions.push( actionSet );
			
			list.contextActions = contextActions;
			
			if( title != null )
			{
				list.dataProvider = Cities.getCities( title );
			}
		}
		
		private function contextMenuClosing( event:ContextMenuEvent ):void
		{
			list.selectedItem = null;
			__contextMenuOpen = false;
		}

		private function contextMenuSelected( event:ActionEvent ):void
		{
			if( event.action == homeAction )
			{
				Weather.setHomeCity(list.selectedItem.label);
			}
			else if( event.action == favAction )
			{
				Cities.saveFovorite( list.selectedItem.label, true );
			}
		}

		private function contextMenuOpening( event:ContextMenuEvent ):void
		{
			var data:Object = list.longPressedItem;
			var actionSet:ActionSet = list.contextActions[ 0 ];
			
			actionSet.title = data.label;
			__contextMenuOpen = true;
			
		}

		private function listClicked( event:ListEvent ):void
		{
			if( __contextMenuOpen )
			{
				return;
			}
			
			var weather:HomeView = new HomeView();
			weather.title = event.data.label;
			var prop:NavigationPaneProperties = new NavigationPaneProperties();
			prop.backButton = new Action( "Names" );
			weather.paneProperties = prop;
			pushPage( weather );
			
			list.selectedItem = null;
		}
	}
}
