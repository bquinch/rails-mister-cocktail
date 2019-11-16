import 'bootstrap';
import 'select2/dist/css/select2.css';

import { initSelect2 } from '../components/init_select2';
import { btn_cocktail_toggle } from '../components/btn_cocktail_toggle';
import { btn_ingredient_toggle } from '../components/btn_ingredient_toggle';
import { btn_review_toggle } from '../components/btn_review_toggle';

initSelect2();
btn_cocktail_toggle();
btn_ingredient_toggle();
btn_review_toggle();
