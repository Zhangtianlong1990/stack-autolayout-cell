# AutolayoutCell
Auto Layout实现cell的高度自适应
在Auto Layout之前，cell的高度自适应一般都是使用代码来计算，计算过程比较繁琐，有了Auto Layout之后，要实现cell的高度自适应就变得相对简单，不需要像以前那样子写那么多恶性的布局代码了。
以下是一些关键代码的说明：
```objc
/**
 * 返回每一行的估计高度
 * 只要返回了估计高度，那么就会先调用tableView:cellForRowAtIndexPath:方法创建cell，再调用tableView:heightForRowAtIndexPath:方法获取cell的真实高度
 * 只有当cell将要显示的时候才会调用tableView:heightForRowAtIndexPath:方法
 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
```
在计算cell的高度之前需要强制布局：
```objc
//一旦强制布局，就会计算出子控件的位置尺寸，方便下面计算cell的高度
    [self layoutIfNeeded];
    
```
UILabel在约束的时候宽高不需要设置，但在`awakeFromNib`需要对换行的UILabel设定最大的宽度，否则计算出来的高度有可能不够准确：
```objc
- (void)awakeFromNib
{
    [super awakeFromNib];
    // 设置label每一行文字的最大宽度
    // 为了保证计算出来的数值跟真正显示出来的效果一致
    //给标签设置最大的长度，根据屏幕尺寸改变
    self.contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
}
```
如果cell想要显示的时候，就会从`tableView:heightForRowAtIndexPath:`方法取出对应的数据模型获取高度：
```objc
/**
 *  返回每一行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JLStasus *staus = self.statuses[indexPath.row];
    return staus.cellHeight;
}
```
![image](https://github.com/JlongTian/AutolayoutCell/blob/master/image/showImage.gif)
