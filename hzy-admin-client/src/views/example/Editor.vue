<script lang="ts" setup>
import { ref } from "vue";
import WangEditor from "@/core/components/WangEditor.vue";
import PageContainer from "@/core/components/PageContainer.vue";
defineOptions({ name: "EditorCom" });

const text = ref("");
text.value = `
<h1 style="text-indent: 0px; text-align: center;"><strong>字观新时代&nbsp;|&nbsp;栋梁之“材”</strong></h1>

 <p style="text-indent: 0px; text-align: justify;">1916年春，远在日本留学的李大钊写下万言雄文《青春》，在风雨如晦的旧中国，振奋无数青年斗志，唤醒了青春中华。之后发生的五四运动如同一道闪电照亮了历史的星空……</p><p style="text-indent: 0px; text-align: justify;"><br></p><p style="text-indent: 0px; text-align: justify;">1922年，在中国共产党直接领导下，中国共产主义青年团前身——中国社会主义青年团宣告成立。</p><p style="text-indent: 0px; text-align: center;"><img src="https://nimg.ws.126.net/?url=http%3A%2F%2Fcms-bucket.ws.126.net%2F2022%2F0508%2Fd8072ae7j00rbk1ee00ikc002bc01jkc.jpg&amp;thumbnail=660x2147483647&amp;quality=80&amp;type=jpg" alt="" data-href="" style=""></p><p style="text-indent: 0px; text-align: justify;">2020年5月3日，人们在中国社会主义青年团中央机关旧址纪念馆参观。</p><p style="text-indent: 0px; text-align: justify;">回望百年，青春是我们党与生俱来的优秀基因，青年是我们党干事创业的重要力量。习近平总书记曾说：“我们党取得的所有成就都凝聚着青年的热情和奉献。”</p><p style="text-indent: 0px; text-align: justify;">百年来，一批又一批中国青年为了实现国家富强、民族复兴、人民幸福接续奋斗，为了建设他们理想中的美好中国、青春中国，甚至不惜献上年轻的生命。陈树湘、赵一曼、邱少云、黄继光、雷锋……他们的青春和故事激励后人；钱学森、邓稼先等一大批青年英才突破重重封锁回到祖国，成为建设新中国的栋梁；进入新时代，一批又一批中国青年与时代偕行，在实现中华民族伟大复兴中国梦的生动实践中放飞青春梦想。</p><p style="text-indent: 0px; text-align: justify;">习近平总书记重视青年工作、关心青年成长成才，也对广大青年寄予厚望。这从他在地方工作时的一封书信，可见一斑。</p><p style="text-indent: 0px; text-align: justify;">1983年12月的一天，曹兵海和其他几位河北农业大学正定籍的同学收到时任正定县委书记习近平同志的一封特别来信。</p><p style="text-indent: 0px; text-align: justify;">习近平在信中这样写道：“农村迫切需要农大学生，农大学生同样也离不开农村。可以说，家乡的40多万父老乡亲都在翘首以待，盼望着你们早日以优异成绩成就学业，为祖国的四化建设挑梁扛柱，竭智尽才。”</p><p style="text-indent: 0px; text-align: justify;">字里行间，流露出习近平求才思贤的真情。</p><p style="text-indent: 0px; text-align: justify;">受到习近平同志的真情感召，河北农业大学1984届至1987届正定籍51名大学生中有一多半人回到正定工作。后来，这些当年陆续回乡工作的大学生在当地农业、畜牧、林业等一线部门独当一面，他们之中多位还成了石家庄市、河北省乃至全国的专家。</p><p style="text-indent: 0px; text-align: center;"><img src="https://nimg.ws.126.net/?url=http%3A%2F%2Fcms-bucket.ws.126.net%2F2022%2F0508%2F9bb5a5f8j00rbk1ee00gpc002bc01oac.jpg&amp;thumbnail=660x2147483647&amp;quality=80&amp;type=jpg" alt="" data-href="" style=""></p><p style="text-indent: 0px; text-align: justify;">2013年5月4日，习近平总书记来到中国航天科技集团公司中国空间技术研究院，同各界优秀青年代表座谈并发表重要讲话。这是座谈会前，总书记和在展厅参观的优秀青年代表交谈。</p><p style="text-indent: 0px; text-align: justify;">“努力成为可堪大用、能担重任的栋梁之材。”这是2013年5月4日，在同各界优秀青年代表座谈时，总书记对广大青年提出的殷切期望。</p><p style="text-indent: 0px; text-align: justify;">“栋梁之材”四个字，成为总书记寄望新时代青年的重要关键词之一。如何成为栋梁之材？总书记在一次次与青年的交流互动中给出答案。</p><p style="text-indent: 0px; text-align: center;"><img src="https://nimg.ws.126.net/?url=http%3A%2F%2Fcms-bucket.ws.126.net%2F2022%2F0508%2F7eb08a67j00rbk1ee00blc000u001hcc.jpg&amp;thumbnail=660x2147483647&amp;quality=80&amp;type=jpg" alt="" data-href="" style=""></p><p style="text-indent: 0px; text-align: justify;">谈爱国，总书记告诫“爱国，不能停留在口号上，而是要把自己的理想同祖国的前途、把自己的人生同民族的命运紧密联系在一起，扎根人民，奉献国家”。</p><p style="text-indent: 0px; text-align: justify;">谈理想信念，总书记叮嘱“树立对马克思主义的信仰、对中国特色社会主义的信念、对中华民族伟大复兴中国梦的信心，到人民群众中去，到新时代新天地中去”。</p><p style="text-indent: 0px; text-align: justify;">谈“练就过硬本领”，总书记提示“学习是成长进步的阶梯，实践是提高本领的途径”，鼓励广大青年“让勤奋学习成为青春远航的动力，让增长本领成为青春搏击的能量”。</p><p style="text-indent: 0px; text-align: justify;">谈“创新创造”，总书记指出“青年是社会上最富活力、最具创造性的群体，理应走在创新创造前列”。</p><p style="text-indent: 0px; text-align: justify;">…………</p><p style="text-indent: 0px; text-align: justify;">高校肩负着为国家建设培养、输送人才的重任。总书记曾说：“每年五四前后，这个时间我是留给青年人的，到年轻人中间和青年学生相处，到学校看看。”党的十八大以来，总书记23次到大学校园考察。</p><p style="text-indent: 0px; text-align: justify;">2014年5月4日，总书记来到五四运动策源地北京大学，以“人生的扣子从一开始就要扣好”的生动比喻，指出价值观教育要抓早、抓实的重要性。</p><p style="text-indent: 0px; text-align: justify;">2021年4月19日，总书记走进母校清华大学，鼓励广大青年“立大志、明大德、成大才、担大任”，“让青春在为祖国、为民族、为人民、为人类的不懈奋斗中绽放绚丽之花”。</p><p style="text-indent: 0px; text-align: center;"><img src="https://nimg.ws.126.net/?url=http%3A%2F%2Fcms-bucket.ws.126.net%2F2022%2F0508%2F6f1d7cadj00rbk1ee00idc002p801stc.jpg&amp;thumbnail=660x2147483647&amp;quality=80&amp;type=jpg" alt="" data-href="" style=""></p><p style="text-indent: 0px; text-align: justify;">2022年4月25日上午，习近平总书记来到中国人民大学考察调研。这是总书记在立德楼观摩思政课智慧教室现场教学并参与讨论。</p><p style="text-indent: 0px; text-align: justify;">今年五四青年节即将来临之际，总书记来到中国人民大学考察调研，在同人大师生代表座谈时，再次勉励广大青年在青春的赛道上跑出当代青年的最好成绩。</p><p style="text-indent: 0px; text-align: justify;">4月21日，国务院新闻办公室发布《新时代的中国青年》白皮书，这是我国首次专门就青年群体发布白皮书。白皮书中说：“新时代中国青年生逢中华民族发展的最好时期，拥有更优越的发展环境、更广阔的成长空间，面临着建功立业的难得人生际遇。”</p><p style="text-indent: 0px; text-align: justify;">“青年一代有理想、有担当，国家就有前途，民族就有希望，实现我们的发展目标就有源源不断的强大力量”。今天，五四精神的火炬已经传到这一代青年手中。</p><p style="text-indent: 0px; text-align: justify;">总书记深情勉励：“希望广大青年用脚步丈量祖国大地，用眼睛发现中国精神，用耳朵倾听人民呼声，用内心感应时代脉搏，把对祖国血浓于水、与人民同呼吸共命运的情感贯穿学业全过程、融汇在事业追求中。”</p>

`;
</script>

<template>
  <PageContainer>
    <a-alert message="富文本编辑器 WangEditor" type="success">
      <template #description>
        <a target="_blank" href="https://www.wangeditor.com/">查看示例</a>
      </template>
    </a-alert>

    <a-row :gutter="[15, 15]" class="mt-16">
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <WangEditor v-model:html="text" domainName="http://localhost:5600" previewDomainName="http://localhost:5600" :height="560" />
      </a-col>

      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <a-card hoverable :bordered="false" :bodyStyle="{ minHeight: '640px' }">
          <div v-html="text"></div>
        </a-card>
      </a-col>
    </a-row>
  </PageContainer>
</template>

<style scoped></style>
