<div class="flex-1 bg-white p-4">
    <div class="flex flex-col container h-full">
        <div class="flex border-b-2 border-custom_glass basis-2/12 p-4">
            <div class="flex-1 flex items-center text-4xl text-gray-600 font-montserrat font-semibold "><?php echo $pageContent['title']?></div>
            <div class="flex flex-col items-end flex-1 text-gray-600">
                <p class="font-roboto font-semibold">Alberto Josué Cancela Arredondo</p>
                <p class="font-roboto font-semibold"><?php echo strftime('%A, %d de %B del %Y')?></p>
            </div>
        </div>
        <div class=" flex-1 flex p-6 justify-around"> 
            <?php 
                    include_once 'components/content/' . $pathContent;
                ?>
        </div>
    </div>
</div>