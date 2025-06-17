import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecommendView extends ConsumerWidget {
  const RecommendView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          isSex: true,
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
          isSex: false,
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
          isSex: true,
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
            onTap: () => {print("AAAA")},
          ),
          _buildTopicTag(
            hash: '#',
            title: '#骗子酒馆', // 根据图片修正
            subtitle: '11499条动态',
            onTap: () {
              print('点击了 热门话题');
              // 这里可以添加点击后跳转到热门话题页面等逻辑
            },
          ),
          _buildTopicTag(
            hash: '#',
            title: '#最',
            subtitle: '11499条动态',
            onTap: () {
              print('点击了 热门话题');
              // 这里可以添加点击后跳转到热门话题页面等逻辑
            },
          ),
          _buildTopicTag(
            hash: '#',
            title: '#最',
            subtitle: '323条动态',
            onTap: () {
              print('点击了 热门话题');
              // 这里可以添加点击后跳转到热门话题页面等逻辑
            },
          ),
          _buildTopicTag(
            hash: '#',
            title: '#最',
            subtitle: '323条动态',
            onTap: () {
              print('点击了 热门话题');
              // 这里可以添加点击后跳转到热门话题页面等逻辑
            },
          ),
          _buildTopicTag(
            hash: '#',
            title: '#最',
            subtitle: '323条动态',
            onTap: () {
              print('点击了 热门话题');
              // 这里可以添加点击后跳转到热门话题页面等逻辑
            },
          ),
          // 添加更多标签...
        ],
      ),
    );
  }

  // 话题标签的具体实现，包含两行文字
  Widget _buildTopicTag(
      {required String hash,
      required String title,
      required String subtitle,
      VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.only(right: 8), // 标签之间的外部间距
      child: InkWell(
        onTap: onTap, // 将传入的onTap回调赋给InkWell
        splashFactory: NoSplash.splashFactory, // 移除波纹效果
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 8), // 调整整个标签的内边距
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
                      fontSize: 12, // 副标题字体大小和标题保持一致，如果需要可以再改小
                      color: Color(0xFF909090), // 副标题颜色调整为灰色
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 添加游戏提示栏 (发动态区域)
  Widget _buildPublishGuide() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 239, 239), // 图片中的背景色
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
              fixedSize: const Size(220, 30), // 宽 200，高 50
              foregroundColor: const Color(0xFF333333), // 文字和图标颜色
              backgroundColor: Colors.white, // 按钮背景色
              side: BorderSide(color: Colors.grey, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
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
    required bool isSex,
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
              isSex: isSex),
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
                color: const Color.fromARGB(255, 223, 222, 222),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(hashtag,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 10, 10, 10), fontSize: 13)), // 蓝色话题文字
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
    required bool isSex,
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
                  isSex
                      ? const Icon(Icons.man,
                          color: Color.fromARGB(255, 97, 154, 240), size: 14)
                      : const Icon(Icons.woman,
                          color: Color.fromARGB(255, 236, 127, 203), size: 14),
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
            backgroundColor: Colors.white, // 背景白色
            foregroundColor: const Color(0xFFFF9900), // 文字橘色
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Color(0xFFFF9900)), // 橘色描边
            ),
          ),
          child: Text(isFollowed ? '已关注' : '关注'),
        ),
        SizedBox(
          width: 24,
          height: 24,
          child: IconButton(
            icon:
                const Icon(Icons.more_vert, size: 24, color: Color(0xFF909090)),
            onPressed: () {
              print("111");
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent, // 去除高亮
            hoverColor: Colors.transparent,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
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
        Icon(Icons.favorite_border, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text('$likes',
            style: const TextStyle(
                color: Color(0xFF909090), fontSize: 13)), // 数字颜色
        const SizedBox(width: 16),
        Icon(Icons.mode_comment_outlined, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text('$comments',
            style: const TextStyle(
                color: Color(0xFF909090), fontSize: 13)), // 数字颜色
        const SizedBox(width: 16),
        const Icon(Icons.ios_share,
            size: 20, color: Color(0xFF909090)), // 分享图标，更接近iOS样式
        const SizedBox(width: 16),
        // 右侧重叠头像和礼物
        const Spacer(), // 将右侧内容推到最右边
        SizedBox(
          width: 100,
          height: 30, // 足够容纳头像和礼物图标
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Positioned(
                right: 40,
                child: CircleAvatar(
                    radius: 10, backgroundColor: Color(0xFFC4B9A9)),
              ),
              Positioned(
                right: 55,
                child: CircleAvatar(
                    radius: 10, backgroundColor: Colors.orange[300]),
              ),
              Positioned(
                right: 70,
                child: CircleAvatar(
                    radius: 10, backgroundColor: Color(0xFF86C772)),
              ),
              // 礼物图标和数字
              Positioned(
                right: 0,
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
        ),
      ],
    );
  }
}
