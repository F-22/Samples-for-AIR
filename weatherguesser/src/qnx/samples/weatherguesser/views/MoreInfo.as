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
	import qnx.fuse.ui.navigation.NavigationPaneProperties;

	/**
	 * @author juliandolce
	 */
	public class MoreInfo extends TitlePage
	{
		public function MoreInfo()
		{
			super();
		}

		override protected function init():void
		{
			super.init();
			title = "More Info";
			
			var prop:NavigationPaneProperties = new NavigationPaneProperties();
			prop.backButton = new Action( "Info" );
			paneProperties = prop;
		}

	}
}
