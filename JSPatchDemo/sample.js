/*defineClass("JPTableViewController", {
	//instance method defintions
    缺少function
	tableView_didSelectRowAtIndexPath:(tableView, indexPath) {
        var alertView = require('UIAlertView').alloc().init();
        alertView.setTitle('Alert');
        alertView.setMessage('AlertView from js');
        alertView.addButtonWithTitle('OK');
        alertView.show();

//	}
//})
 */

//正确方法：
defineClass('JPTableViewController', {
            tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
            var alertView = require('UIAlertView').alloc().init();
            alertView.setTitle('Alert');
            alertView.setMessage('AlertView from js');
            alertView.addButtonWithTitle('OK');
            alertView.show();
            }
})