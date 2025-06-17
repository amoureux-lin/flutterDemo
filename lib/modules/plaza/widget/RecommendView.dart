import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class RecommendView extends ConsumerWidget {
  const RecommendView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      children: [
        _buildTopicBar(),
        const SizedBox(height: 12),
        _buildPublishGuide(),
        const SizedBox(height: 12),
        // 模拟图片中的第一个 Feed Item (宝葫芦)
        _buildFeedItem(
          username: '宝葫芦',
          time: '10小时前',
          content: '这游戏就该这么玩！战绩绝了！',
          imagesCount: 3, // 3张图片
          hashtag: '#骗子酒馆最好玩', // 注意文字更正为图片中的“骗子酒馆最好玩”
          likes: 52,
          comments: 52,
          gifts: 50,
          isFollowed: false, // 初始未关注
        ),
        // 模拟图片中的第二个 Feed Item (六月的风) - 已去除发布按钮
        _buildFeedItem(
          username: '六月的风',
          time: '11小时前',
          content: '聊一聊最近陪伴你最久的一款游戏？',
          imagesCount: 9, // 无图片
          hashtag: null,
          likes: 0,
          comments: 0,
          gifts: 0,
          isFollowed: true, // 已关注
        ),
        // 您可以根据需要添加更多模拟帖子
        _buildFeedItem(
          username: '游戏爱好者',
          time: '5小时前',
          content: '最近沉迷于这款RPG，谁懂啊！',
          imagesCount: 1, // 1张图片
          hashtag: '#角色扮演游戏',
          likes: 88,
          comments: 20,
          gifts: 5,
          isFollowed: false,
        ),
      ],
    );
  }

  // 热门话题栏
  Widget _buildTopicBar() {
    return SizedBox(
      height: 60, // 确保有足够高度容纳两行文字
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildTopicTag(
            hash: '#',
            title: '热门话题',
            subtitle: '搜索更多话题',
          ),
          _buildTopicTag(
            hash: '#',
            title: '#骗子酒馆', // 根据图片修正
            subtitle: '11499条动态',
          ),
          _buildTopicTag(
            hash: '#',
            title: '#最',
            subtitle: '11499条动态',
          ),
          _buildTopicTag(
            hash: '#',
            title: '#最',
            subtitle: '323条动态',
          ),
          _buildTopicTag(
            hash: '#',
            title: '#最',
            subtitle: '323条动态',
          ),
          _buildTopicTag(
            hash: '#',
            title: '#最',
            subtitle: '323条动态',
          ),
          // 添加更多标签...
        ],
      ),
    );
  }

  // 话题标签的具体实现，包含两行文字 (已修改为匹配最新图片样式)
  Widget _buildTopicTag(
      {required String hash, required String title, required String subtitle}) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 5, vertical: 6), // 调整整个标签的内边距
      child: Row(
        mainAxisSize: MainAxisSize.min, // 让Row只占用所需空间
        crossAxisAlignment: CrossAxisAlignment.center, // 垂直居中对齐
        children: [
          Container(
            width: 35, // 设置固定的宽度，可以调整
            height: 35, // 设置固定的高度，与宽度相同以形成正方形
            alignment: Alignment.center, // 确保子内容（#符号）在Container内居中
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 153, 153, 153), // # 符号的深灰色背景
              borderRadius: BorderRadius.circular(4), // 圆角方形
            ),
            child: Text(
              hash,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white, // # 符号颜色为白色
              ),
            ),
          ),
          const SizedBox(width: 8), // # 符号和文字之间的间距
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center, // 确保文字垂直居中
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 58, 58, 58), // 标题颜色调整为深色
                ),
              ),
              const SizedBox(height: 2), // 标题和副标题之间的间距
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF909090), // 副标题颜色调整为灰色
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 添加游戏提示栏 (发动态区域)
  Widget _buildPublishGuide() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6), // 图片中的背景色
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Text(
            '发动态后，有95%机会获得互动哦',
            style: TextStyle(fontSize: 12, color: Color(0xFF909090)), // 颜色更接近图片
          ),
          const SizedBox(height: 4),
          const Text(
            '来分享攻略，找到同频开黑的游戏搭子',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333)), // 颜色更接近图片
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, size: 18),
            label: const Text('添加游戏', style: TextStyle(fontSize: 14)),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF333333), // 文字和图标颜色
              backgroundColor: Colors.white, // 按钮背景色
              side: BorderSide.none, // 无边框
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            ),
          )
        ],
      ),
    );
  }

  // Feed内容项
  Widget _buildFeedItem({
    required String username,
    required String time,
    required String content,
    required int imagesCount,
    String? hashtag,
    required int likes,
    required int comments,
    required int gifts,
    required bool isFollowed,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
            bottom:
                BorderSide(color: Color(0xFFEDEDED), width: 0.5)), // 底部细线，颜色更浅
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserHeader(
            username: username,
            time: time,
            isFollowed: isFollowed,
          ),
          const SizedBox(height: 8),
          Text(content,
              style: const TextStyle(
                  fontSize: 15, color: Color(0xFF333333))), // 文字颜色
          if (imagesCount > 0) ...[
            const SizedBox(height: 8),
            _buildImageGrid(imagesCount),
          ],
          if (hashtag != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(hashtag,
                  style: const TextStyle(
                      color: Colors.blue, fontSize: 13)), // 蓝色话题文字
            ),
          ],
          const SizedBox(height: 8),
          _buildActionRow(likes: likes, comments: comments, gifts: gifts),
        ],
      ),
    );
  }

  // 用户信息栏
  Widget _buildUserHeader({
    required String username,
    required String time,
    required bool isFollowed,
  }) {
    return Row(
      children: [
        const CircleAvatar(radius: 16, backgroundColor: Colors.grey), // 头像半径16
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(username,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFF333333))), // 字体大小和颜色
                  const SizedBox(width: 4),
                  // 图片中的紫色小图标
                  const Icon(Icons.card_membership,
                      color: Color(0xFFB17DED), size: 14),
                ],
              ),
              Text(time,
                  style: const TextStyle(
                      color: Color(0xFF909090), fontSize: 12)), // 时间颜色
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: isFollowed
                ? const Color(0xFFF4F4F4)
                : const Color(0xFFFFF1E3), // 已关注灰色，未关注浅橙色
            foregroundColor: isFollowed
                ? const Color(0xFF909090)
                : const Color(0xFFFF9900), // 已关注文字灰色，未关注文字橙色
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(isFollowed ? '已关注' : '关注'),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.more_horiz,
            color: Color(0xFF909090), size: 20), // 三点菜单颜色和大小
      ],
    );
  }

  // 图片网格展示
  Widget _buildImageGrid(int count) {
    if (count == 0) return const SizedBox.shrink();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            count == 1 ? 1 : (count == 2 ? 2 : 3), // 单张图一行，两张图两列，三张图三列
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio:
            count == 1 ? 1.5 : (count == 2 ? 1 : 1), // 单张图更宽，两张图正方形，三张图正方形
      ),
      itemCount: count,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200], // 占位背景色
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text('图${index + 1}',
                style: const TextStyle(color: Colors.grey)),
          ),
          // 实际图片可以替换为 Image.network() 或 Image.asset()
          // child: Image.network('your_image_url_here', fit: BoxFit.cover),
        );
      },
    );
  }

  // 点赞评论操作区
  Widget _buildActionRow({
    required int likes,
    required int comments,
    required int gifts,
  }) {
    return Row(
      children: [
        Icon(Icons.favorite_border, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text('$likes',
            style: const TextStyle(
                color: Color(0xFF909090), fontSize: 13)), // 数字颜色
        const SizedBox(width: 16),
        Icon(Icons.mode_comment_outlined, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text('$comments',
            style: const TextStyle(
                color: Color(0xFF909090), fontSize: 13)), // 数字颜色
        const SizedBox(width: 16),
        const Icon(Icons.ios_share,
            size: 18, color: Color(0xFF909090)), // 分享图标，更接近iOS样式
        const SizedBox(width: 16),
        // 右侧重叠头像和礼物
        const Spacer(), // 将右侧内容推到最右边
        Stack(
          alignment: Alignment.centerRight, // 将Stack的内容靠右对齐
          children: [
            Positioned(
              right: 28, // 调整位置以实现重叠
              child:
                  CircleAvatar(radius: 8, backgroundColor: Colors.orange[200]),
            ),
            Positioned(
              right: 14,
              child:
                  CircleAvatar(radius: 8, backgroundColor: Colors.orange[300]),
            ),
            CircleAvatar(
                radius: 8, backgroundColor: Colors.orange[400]), // 最前面的头像
            const SizedBox(width: 20), // 为礼物图标和数字预留空间
            // 礼物图标和数字
            Positioned(
              right: -35, // 负值表示向右超出Stack边界，根据实际调整
              child: Row(
                children: [
                  const Icon(Icons.card_giftcard,
                      size: 18, color: Color(0xFF909090)),
                  const SizedBox(width: 4),
                  Text('$gifts',
                      style: const TextStyle(
                          color: Color(0xFF909090), fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
