/*
* Copyright (c) 2011 Research In Motion Limited.
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

package samples.download.taskmanager.events
{
    
    import flash.events.Event;
    import samples.download.taskmanager.Task;
    
    public class TaskRunnerEvent extends Event
    {
        
        public static const TASK_RUNNER_RETRY:String = "TASK_RUNNER_RETRY";
        
        public var task:Task;
        public var exception:Error;
        public var numOfFailures:int;
        
        public function TaskRunnerEvent(type:String, task:Task, exception:Error, numOfFailures:int)
        {
            super(type, true);
            this.task= task;
            this.exception = exception
            this.numOfFailures = numOfFailures;
        }
    }
}